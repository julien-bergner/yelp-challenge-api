require 'active_support/all'
require 'bundler'

ENV['RACK_ENV'] ||= 'development'
Bundler.require :default, ENV['RACK_ENV'].to_sym

$LOAD_PATH.unshift File.expand_path('../../app', __FILE__)
$LOAD_PATH.unshift File.expand_path('../..', __FILE__)

module API
  class << self
    attr_reader :env, :root
  end
end

API.module_eval do
  @env = ENV['RACK_ENV'].to_sym
  @root = File.expand_path('../..', __FILE__)
end

