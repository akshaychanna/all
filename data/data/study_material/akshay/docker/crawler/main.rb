require "pry"
require "json"
require "yaml"
require "elasticsearch"
require 'pry'
require 'json'
require 'rainbow'
require 'logger'

begin
	@logger = Logger.new(STDOUT)
	@elasticsearch_client = Elasticsearch::Client.new hosts: 'http://localhost:9200/', request_timeout: 90, retry_on_failure: 3, reload_connections: true
	response = @elasticsearch_client.perform_request 'GET', '_cluster/health' rescue nil
	  if(!response)
	    raise "error connecting to elasticsearch - #{@elasticsearch_client}, host - #{elasticsearch_host}"
	  else
		@logger.info Rainbow("connected to elasticsearch !!!").green
	  end

	make = ENV["MAKE"]

	file_crawl = File.read("./config/makes_config.yaml")
	
	object = YAML.load(file_crawl)
	require_relative "./scripts/#{object["makes"][make]["crowler_file"]}"
	
	obj = Kernel.const_get("#{object["makes"][make]["crawler_class"]}").new(make)
	data = obj.get_data
	
	while(data.size > 0)	
	    @logger.info Rainbow("adding documents in first remaing documents are  - #{data.size}").green
	    res = @elasticsearch_client.bulk body: data.slice!(0..200)
	    @logger.info Rainbow("bulk inserting vehicles info  error - #{res.inspect}").red if(res["errors"])
	end

rescue Exception => e
	@logger.info Rainbow(e.message).red
end 	