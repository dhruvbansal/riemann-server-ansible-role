This is an [Ansible](http://www.ansible.com/home) role for installing
[Riemann](http://riemann.io).

You may also be interested in:

* an Ansible role for
  [Riemann dash](https://github.com/dhruvbansal/riemann-dash-ansible-role),
  a web application used to view data in Riemann

# What it Does

## Software

Installs Riemann server.

## Configuration & Logging

Creates the files:

* `/etc/riemann/riemann.config` -- configuration file for Riemann
* `/var/log/riemann` -- log directory for Riemann
* `/etc/logstash/conf.d/riemann.conf` -- configuration file for Logstash

## Services

On Ubuntu/Debian it creates an Upstart script `/etc/init/riemann.conf`
which defines a system service `riemann` listening on the standard
ports.

# Usage

Use the role in a playbook like this:

```yaml
- hosts: all
  roles:
    - riemann-server
```

Set the `riemann_server_use_logstash` to `false` to skip the logstash
configuration.
