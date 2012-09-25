define unicorn($user, $project_path, $daemon_name='unicorn') {
  anchor { "unicorn::begin::${name}": 
    before => File["/etc/init.d/unicorn_${name}"],
    notify => Service["unicorn_${name}"],
  }


  file { "/etc/init.d/unicorn_${name}":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0755',
    content => template('unicorn/unicorn.erb'),
    notify  => Service["unicorn_${name}"],
  }

  service { "unicorn_${name}":
    ensure     => running,
    enable     => true,
  }

  anchor { "unicorn::end::${name}": 
    require => Service["unicorn_${name}"],
  }  
}
