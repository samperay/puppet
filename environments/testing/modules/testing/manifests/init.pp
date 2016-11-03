class testing {
file { '/tmp/testing':
  ensure  => present,
  owner   => 'root',
  group   => 'root',
  mode    => '0777',
  source  => 'puppet:///modules/testing/testing.conf',
   }
}
