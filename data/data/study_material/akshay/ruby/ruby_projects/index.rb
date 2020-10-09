require 'elasticsearch'
require 'pry'
require 'json'
require 'rainbow'
require 'logger'

def call
	#host=ENV[host]
	#port=ENV[port]
	elastic_host='http://localhost'
	elastic_port=5601
	binding.pry
	elasticsearch_host =  [ { host: elastic_host, port: elastic_port, user: 'admin', password: 'z3r3br@l', scheme: 'http' }]
	@elasticsearch_client = Elasticsearch::Client.new hosts: 'http://localhost:9200/', request_timeout: 90, retry_on_failure: 3, reload_connections: true
	
	#@elasticsearch_client= Elasticsearch::Client.new url:'https://localhost:9200'
	response = @elasticsearch_client.perform_request 'GET', '_cluster/health' rescue nil
  if(!response)
    raise "error connecting to elasticsearch - #{@elasticsearch_client}, host - #{elasticsearch_host}"
  else
	puts "connected to elasticsearch !!!"
  end
	
end


call

