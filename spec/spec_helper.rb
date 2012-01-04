require "rubygems"
require "bundler"
Bundler.setup

$:.unshift File.expand_path("../../lib", __FILE__)

require "rack/combobot"

require 'minitest/spec'
require 'minitest/autorun'
require 'rack/test'
