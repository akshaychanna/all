require 'elasticsearch'
require 'pry'
require 'json'
require 'rainbow'
require 'logger'
require './get_data'
require './home'

def call
	@logger = Logger.new(STDOUT)
	@elasticsearch_client = Elasticsearch::Client.new hosts: 'http://localhost:9200/', request_timeout: 90, retry_on_failure: 3, reload_connections: true
	response = @elasticsearch_client.perform_request 'GET', '_cluster/health' rescue nil
	  if(!response)
	    raise "error connecting to elasticsearch - #{@elasticsearch_client}, host - #{elasticsearch_host}"
	  else
		puts "connected to elasticsearch !!!"
	  end
end

get_data.each{|x|
	binding.pry
	res = @elasticsearch_client.msearch body: [{ index: 'second', type: '_doc', search: {
			query:{bool:{must:[{match: {
				"make":x[:make]
			} } ]}}
	}}]
}





###for indexing singl doc

begin
	include Home
	connection_to_elastic
	call
	bulk_body = []
	get_data.each { |x|
			object = {
				:make => "maruti",
				:year =>800,
				:model =>"old",
				:trim => x[:trim]
			}

			@logger.info Rainbow("adding documents in first remaing documents are  - #{bulk_body.size}").green
	   		binding.pry
	   	    res = @elasticsearch_client.index  index: 'second'  , type: '_doc' , body: object

	    	@logger.info Rainbow("bulk inserting seed target documents error - #{res.inspect}").red if(res["errors"])
			break
	}

	# while(bulk_body.size > 0)	
	#     @logger.info Rainbow("adding documents in first remaing documents are  - #{bulk_body.size}").green
	#     res = @elasticsearch_client.bulk body: bulk_body.slice!(0..200)
	#     @logger.info Rainbow("bulk inserting seed target documents error - #{res.inspect}").red if(res["errors"])
	# end		
rescue Exception 
	
end

