require 'yaml'
require 'json'
abc = File.new("/home/zerebral/akshay/ruby/ruby_projects/yml_load/test.yaml")
db_config = YAML.load(abc.read)
abc.close
p db_config

puts
puts "_______________________________________________"
puts

puts "JOBS:"
puts 
 
p db_config["jobs"]

puts 
puts "_____________________________________________________"
puts 

puts "JOBS:test"
puts

p db_config["jobs"]["test"]
puts
p db_config["jobs"]["test"]["steps"]
puts "WORKFLOW"
puts

p db_config["workflows"]


var = {
	name: "akshay",
	age: 25,
	gender: "male",
	state: "Maharashtra",
	city: "solapur",
	country: "INDIA"
      }

abc = File.new("/home/zerebral/akshay/ruby/ruby_projects/yml_load/p.yaml","a")
abc.write(var.to_yaml)

#File.open("write.yaml","w") { |file| file.write(var.to_yaml) }
