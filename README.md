This is an [Ansible](http://www.ansible.com/home) role for installing
[Riemann](http://riemann.io).

You may also be interested in:

* an Ansible role for
  [Riemann dash](https://github.com/dhruvbansal/riemann-dash-ansible-role),
  a web application used to view data in Riemann

# What it Does

## Software

Installs Riemann server, either via `.deb` and `.rpm` packages
(`riemann_use_package`, default true) or from a tarball
(`riemann_use_tarball`).

Writes a configuration file for Logstash to pick up Riemann's logs.  
Set the `riemann_server_use_logstash` to `false` to disable this
integration.

## Configuration & Logging

Creates the files:

* `/etc/riemann/riemann.config` -- configuration file for Riemann
* `/var/log/riemann` -- log directory for Riemann
* `/etc/logstash/conf.d/riemann.conf` -- configuration file for Logstash

## Services

Creates the service `riemann`.

FIXME: No service is set up when using RedHat and
`riemann_use_tarball`...


# Usage

Use the role in a playbook like this:

```yaml
- hosts: all
  roles:
    - riemann-server
```
