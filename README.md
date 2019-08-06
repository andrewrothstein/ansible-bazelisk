andrewrothstein.bazelisk
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-bazelisk.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-bazelisk)

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
