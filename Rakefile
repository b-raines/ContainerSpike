# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  require './config/cc_app_setup.rb'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  CCAppSetup.new(app).config do |setup|
    setup.configure_application
    setup.inject_frameworks
    setup.add_resources
    setup.add_plist_properties
    setup.require_cocoapods
  end
end
