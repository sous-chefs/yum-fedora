# yum-fedora Cookbook CHANGELOG

This file is used to list changes made in each version of the yum-fedora cookbook.

## 3.1.6 - *2024-05-01*

## 3.1.5 - *2023-11-01*

## 3.1.4 - *2023-02-14*

## 3.1.3 - *2023-02-14*

## 3.1.2 - *2021-08-31*

- Standardise files with files in sous-chefs/repo-management

## 3.1.1 - *2021-06-01*

- Standardise files with files in sous-chefs/repo-management

## 3.1.0 - *2021-03-03*

- Sous Chefs adoption
- Various style fixes
- Remove references to < Fedora 20

## 3.0.0 (2018-02-16)

- Require Chef 12.14+ and remove compat_resource dep

## 2.0.2 (2017-06-14)

- Switch from Rake testing to Local Delivery for testing
- Update apache2 license string to use a SPDX compliant string

## 2.0.1 (2016-12-22)

- Add integration testing with inspec
- Depend on the latest compat_resource cookbook
- Cookstyle fixes

## 2.0.0 (2016-11-26)

- Replace yum dependency with compat_resource

## 1.0.0 (2016-09-06)

- Testing updates
- Resolve rubocop warnings
- Add chef_version metadata
- Remove support for Chef 11

## v0.3.4 (2015-11-30)

- Fix attributes with a value of false being skipped

## v0.3.3 (2015-10-28)

- #4 Guard against conflicting name spaces with other platforms #4

## v0.3.2 (2015-10-28)

- Fixing Chef 13 nil property deprecation warnings

## v0.3.1 (2015-09-21)

- Increased the yum depencency from ~3.0 to ~3.2
- Added Chef standard Rubocop file and resolved all warnings
- Updated platforms in Kitchen CI config
- Add supported platforms to the metadata
- Added Chef standard chefignore and .gitignore files
- Updated and expanded development dependencies in the Gemfile
- Added contributing, testing, and maintainers docs
- Added platform requirements to the readme
- Added Travis and cookbook version badges to the readme
- Update Chefspec to 4.X format
- Added long_description to metadata
- Added source_url and issues_url to metadata

## v0.3.0 (2014-09-02)

- 2 - Add all attribute available to LWRP to allow for tuning

## v0.2.2 (2014-03-12)

- Correctly set gpgkey for Fedoras >= 20

## v0.2.0 (2014-02-14)

- updating test harness
- disabling uncommonly used repositoryid by default

## v0.1.4

- Adding CHANGELOG.md

## v0.1.0

- initial release
