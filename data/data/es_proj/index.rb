require 'elasticsearch'
require 'json'
require 'rainbow'
require 'pry'
require 'logger'
require './print'


def call
	@logger = Logger.new(STDOUT)
	@elasticsearch_client = Elasticsearch::Client.new host: 'http://localhost:9200/', request_timeout:90, retry_on_failure:3 , reload_connections: true
	response = @elasticsearch_client.perform_request 'GET', '_cluster/health' rescue nil
	if(!response)
		raise "error connecting to elasticsearch - #{@elasticsearch_client}, host - #{elasticsearch_host}"
	else
		@logger.info Rainbow("connected to elasticseach...!!!").green
	end

end
 
call
count = 0

begin
	
bulk_body = []
abc.each { |x|
	object = {}
	object = {
		:is_car => x["_source"]["is_car"],
		:proxy_pref => x["_source"]["proxy_pref"],
		:is_field_config_available => x["_source"]["is_field_config_available"],
		:is_multi_lang => x["_source"]["is_multi_lang"],
		:is_crawl_config_available => x["_source"]["is_crawl_config_available"],
		:last_known_worker => x["_source"]["last_known_worker"],
		:crawl_status => x["_source"]["crawl_status"]
	}
	count = count + 1

	bulk_body << {
		index: {
			_index: 'target', _type: '_doc', data: object
		}
	}
	binding.pry


}

#binding.pry

do_not_exits = []

#bulk_body.each { |obj|
#	binding.pry
# 	response = @elasticsearch_client.msearch body: [{ index: 'target' , type: '_doc' , search: {
# 		"query": {
# 			"bool": {
# 				"must": [
# 					{
# 						"match":{
# 							"is_car": obj[:index][:data][:is_car]
# 						}
# 					},
# 					{
# 						"match":{
# 							"proxy_pref": obj[:index][:data][:proxy_pref]
# 						}
# 					},
# 					{
# 						"match":{
# 							"is_field_config_available": obj[:index][:data][:is_field_config_available]
# 						}
# 					},
# 					{
# 						"match":{
# 							"is_multi_lang": obj[:index][:data][:is_multi_lang]
# 						}
# 					},
# 					{
# 						"match":{
# 							"is_crawl_config_available": obj[:index][:data][:is_crawl_config_available]
# 						}
# 					},
# 					{
# 						"match":{
# 							"last_known_worker": obj[:index][:data][:last_known_worker]
# 						}
# 					},
# 					{
# 						"match":{
# 							"crawl_status": obj[:index][:data][:crawl_status]
# 						}
# 					}
# 				]
# 			}
# 		}
# 	}}]

# binding.pry
# #	do_not_exits << obj if response
#}
#binding.pry
#binding.pry
# while(bulk_body.size > 0)
# 		binding.pry	
# 	    @logger.info Rainbow("adding documents in first remaing documents are  - #{bulk_body.size}").green
# 	    res = @elasticsearch_client.bulk body: bulk_body.slice!(0..100)
# 	    @logger.info Rainbow("bulk inserting seed target documents error - #{res.inspect}").red if(res["errors"])
# end		


# while(bulk_body.size > 0)
# 	@logger.info Rainbow("adding documents in first remaing documents are  - #{bulk_body.size}").green
# 	res = @elasticsearch_client.bulk body: bulk_body.slice!(0..200)
# 	@logger.info Rainbow("bulk inserting target documents error - #{res.inspect}").red if(res["errors"])
# 	end	
p count	

rescue Exception => e
	
end
