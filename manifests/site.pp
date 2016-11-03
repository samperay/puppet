file {'masterserver':
    ensure => present,
    path => '/tmp/masterserver',
    mode => 644,
    owner => root,
    group => root,
    content => 'on succsful test I must be born in /tmp/ and reader should study this message
'
}
