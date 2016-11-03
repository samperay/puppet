class ntp {
        case $operatingsystem {
               redhat,centos:  {
                   $service_name = 'ntpd'
                   $conf_file = 'ntp.conf_changeme'
               }
               ubuntu,debian: {
                   $service_name = 'ntp'
                   $conf_file = 'ntp.conf.ubuntu'
               }
        }
               package {'ntp':
                ensure =>installed,
               }
               service { 'ntp':
                name => $service_name,
                ensure => running,
                enable => true,
                subscribe => File['ntp.conf'],
               }
               file {'ntp.conf':
                path => '/etc/ntp.conf',
                ensure => file,
                require => Package['ntp'],
                source => "puppet:///modules/ntp/${conf_file}",
               }
}
