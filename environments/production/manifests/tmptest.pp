class tmptest {
file {'production':
       path => '/tmp/production',
       ensure => present,
       mode => 640,
       content => 'I am creating from the testfile ..
'
}
}
