# frozen_string_literal: true

name 'yum-fedora'
default_source :supermarket

run_list 'test::default'

cookbook 'yum-fedora', path: '.'
cookbook 'test', path: './test/cookbooks/test'

named_run_list :default, 'test::default'
named_run_list :enable_all, 'test::enable_all'
