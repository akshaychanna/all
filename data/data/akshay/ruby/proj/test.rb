require 'rubygems'
require 'pry'
require 'logger'
require 'elasticsearch'
require 'json'
require 'uri'
require 'csv'
require 'rainbow'

require "./100_radious_zip.rb"
urls = []
bulk_body = []
data = {}
count=0


def call
	#host=ENV[host]
	#port=ENV[port]
	elastic_host='http://localhost'
	elastic_port=5601
	#binding.pry
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

get_zip.each do |a|
#	puts a
	urls << a
	break if count==5
	count += 1
end

p urls


urls.each do |url|
	first = {
		:make => "honda",
		:model => "fz",
		:trim => "abc",
		:year => url
	}


bulk_body << {
	index: {
		_index: 'first', _type: '_doc', _id: '_id', data: first
	}
}
end

while(bulk_body.size > 0)
	i=0
    #@logger.info Rainbow("creating doc in index remaining records count - #{bulk_body.size}").green
    res = @elasticsearch_client.bulk body: bulk_body[i]
    #@logger.info Rainbow("bulk inserting seed target documents error - #{res.inspect}").red if(res["errors"])
  	i += 1
  end


puts "done"



# get_data.each { |a|

# 	a.each { |x,y|
# 		p x
# 		p y
# 	}
# 	puts
# 	break if count==10
# 	count+=1
# }
# com = []
# puts "hey"
# count=0
# get_data.each do |x|
# 			com << x[:model]
# 			 break if count==10
# 			 count += 1
# 	end

# puts com

