require 'elasticsearch'
require 'pry'
require 'json'
require 'rainbow'
require 'logger'
require './get_data'
#require './home'

def call
	@logger = Logger.new(STDOUT)
	@elasticsearch_client = Elasticsearch::Client.new hosts: 'http://localhost:9200/', request_timeout: 90, retry_on_failure: 3, reload_connections: true
	response = @elasticsearch_client.perform_request 'GET', '_cluster/health' rescue nil
	  if(!response)
	    raise "error connecting to elasticsearch - #{@elasticsearch_client}, host - #{elasticsearch_host}"
	  else
		@logger.info  Rainbow("connected to elasticsearch !!!").green
	  end
end

begin
	call
	count = 1
	bulk_body = []
	get_data.each { |x|
			object = {
				:make => x[:make],
				:year => x[:year],
				:model => x[:model],
				:trim => x[:trim],
				:id => count
			}
			count += 1
			bulk_body << {
							index: {
								_index: 'third' , _type: '_doc' , data: object
							}
			}
	}

binding.pry
	do_not_exits = []
	bulk_body.each { |obj|
		
		es_response = @elasticsearch_client.msearch body: [{ index: 'third', type: '_doc', search: {
                      "query": {
    					"bool": {
     					 "must": [
       						 {"match": {
         						 "id": obj[:index][:data][:id]
       								 }
       						 }
      					]
					    }
					  }
                     }
                     }]
    	do_not_exits << obj if es_response["responses"][0]["hits"]["hits"].empty? 
    }

	while(do_not_exits.size > 0)	
	    @logger.info Rainbow("adding documents in first remaing documents are  - #{bulk_body.size}").green
	    res = @elasticsearch_client.bulk body: do_not_exits.slice!(0..200)
	    @logger.info Rainbow("bulk inserting seed target documents error - #{res.inspect}").red if(res["errors"])
	end		
rescue Exception 
	
end

