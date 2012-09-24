define unicorn($user, $project_path, $daemon_name='unicorn') {
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
}
