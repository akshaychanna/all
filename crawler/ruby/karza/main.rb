require "pry"
require "json"
require "yaml"
require "elasticsearch"
require 'pry'
require 'json'
require 'rainbow'
require 'logger'


begin
	print("hello")
	# binding.pry
	@logger = Logger.new(STDOUT)
	require_relative "adapter.rb"
	obj = Kernel.const_get("Adapter").new()
	@logger.info Rainbow("Getting started....").green
	data = obj.get_data
	binding.pry

rescue Exception => e
	
end