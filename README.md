andrewrothstein.bazelisk
=========
![Build Status](https://github.com/andrewrothstein/ansible-bazelisk/actions/workflows/build.yml/badge.svg)

Installs [bazelisk](https://github.com/bazelbuild/bazelisk).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.bazelisk
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
