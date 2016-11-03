class http {
        case $operatingsystem {
                centos,redhat: {
                    $service_name = 'httpd'
                    $conf_file = 'httpd.conf'
                    $documentrootfile = 'index.html'
                }
                ubuntu,debian: {
                    $service_name = 'http'
                    $conf_file = 'http.conf'
                }
        }
                package {'httpd':
                    ensure => installed,
                }
                service {'httpd':
                    name => $service_name,
                    ensure => running,
                    enable => true,
                    subscribe => File['httpd.conf']
                }
                file {'httpd.conf':
                    path => '/etc/httpd/conf/httpd.conf', 
                    ensure => file,
                    require => Package['httpd'],
                    source => "puppet:///modules/http/${conf_file}",
                }
                file {'index.html':
                    path => '/var/www/html/index.html',
                    ensure => present,
                    mode => 600,
                    owner => root,
                    group => root,
                    source => "puppet:///modules/http/${documentrootfile}",
                }

}
                    
