# Manage Unicorn services on /etc/init.d

## Description
This module manages Unicorn services on /etc/init.d. It creates a startup script at /etc/init.d from a template.

## Parameters

- name - name of the app
- user - user that Unicorn should run as
- project_path - relative path of the app on the server after `/home/${user}/`
- daemon_name - name of the Unicorn script to be found at app/bin. Defaults to `unicorn`

## Usage

### Unicorn

Create the startup script `/etc/init.d/unicorn_mygreatapp`, and makes sure that the service is running and will run automatically on the server startup.

    unicorn { 'mygreatapp':
      user         => 'john',
      project_path => 'railsapps/mygreatapp/current',
      daemon_name  => 'unicorn_production',
    }

## Authors

[Vinícius Teles](https://github.com/viniciusteles)

## License

This Puppet module is released under the MIT license:

* http://opensource.org/licenses/MIT
