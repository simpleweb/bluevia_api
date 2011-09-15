#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

task :default => [:test]

desc "Run basic tests"
Rake::TestTask.new(:test) do |t|
  t.pattern = 'test/*_test.rb'
  t.verbose = true
end
