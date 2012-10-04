define unicorn($user_name, $home_dir, $project_name, $projects_dir, $environment='development') {
  
  file { "/etc/init.d/unicorn_${project_name}_${environment}":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0755',
    content => template('unicorn/unicorn.erb'),
    notify  => Service["unicorn_${project_name}_${environment}"],
  }

  service { "unicorn_${project_name}_${environment}":
    ensure     => running,
    enable     => true,
  }
}
