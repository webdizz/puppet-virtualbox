# VirtualBox Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-virtualbox.svg?branch=master)](https://travis-ci.org/boxen/puppet-virtualbox)

## Usage

```puppet
include virtualbox
```

## Required Puppet Modules

* `ripienaar/puppet-module-data`

## Hiera Configuration

The following variables may be automatically overridden with Hiera:

```
---
# Keep VirtualBox up to date
virtualbox::version: "4.3.14"
virtualbox::patchlevel: "95030"
```

It is **required** that you include
[ripienaar/puppet-module-data](https://github.com/ripienaar/puppet-module-data)
in your boxen project, as this module now ships with many pre-defined
configurations in the `data/` directory. With this module included, those
definitions will be automatically loaded, but can be overridden easily in your
own hierarchy.

You can also use JSON if your Hiera is configured for that.
