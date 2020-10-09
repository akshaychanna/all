require 'rubygems'
require 'pry'
require 'logger'
require 'elasticsearch'
require 'json'
require 'uri'
require 'csv'
require 'rainbow'
require 'xtractly_http_get'
require "active_record"
db_conf_file = File.new("./info.yaml", 'r')
file = YAML.load(db_conf_file.read)
