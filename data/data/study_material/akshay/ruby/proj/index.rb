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



begin
	include Home
#	connection_to_elastic
	#binding.pry
	call
	puts "hi"
	#binding.pry
	bulk_body = []
	get_data.each { |x|
	#	binding.pry
	
	object = {
				:make => x[:make],
				:year => x[:year],
				:model => x[:model],
				:trim => x[:trim]
			}
			bulk_body << {
							index: {
								_index: 'first' , _type: '_doc' , data: object
							}
			}
	}



do_not_exist = []

bulk_body.each { |obj|
#	binding.pry
#p obj[id]
	response = @elasticsearch_client.msearch body: [{ index: 'first', type: '_doc' , search: {
		"query": {
			"bool": {
				"must": [
					{
						"match": {
							"make": obj[:index][:data][:make]
						}
					},
					{
						"match":{
							"model": obj[:index][:data][:model]
						}
					},
					{
						"match": {
							"year": obj[:index][:data][:year]
						}
					},
					{
						"match": {
							"trim": obj[:index][:data][:trim]
						}
					}
				]
			}
		}
	}}]
#	binding.pry
#	p response
	do_not_exist << obj if response["responses"][0]["hits"]["hits"].empty?
	#binding.pry
}
binding.pry
	while(do_not_exist.size > 0)	
	    @logger.info Rainbow("adding documents in first remaing documents are  - #{bulk_body.size}").green
	    res = @elasticsearch_client.bulk body: do_not_exist.slice!(0..200)
	    @logger.info Rainbow("bulk inserting seed target documents error - #{res.inspect}").red if(res["errors"])
	end		
rescue Exception 
	
end

