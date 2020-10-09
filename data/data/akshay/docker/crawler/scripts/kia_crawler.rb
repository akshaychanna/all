require 'logger'
require 'rainbow'

class KiaCrawler
	def initialize(make)
		@make = make
		@logger = Logger.new(STDOUT)
	end

	def get_data
		@logger.info Rainbow("Getting curl data of #{@make} api").green
		curl_data = `curl 'https://www.kia.com/us/services/en/inventory/initial' -H 'sec-fetch-mode: cors' -H 'origin: https://www.kia.com' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: en-GB,en-US;q=0.9,en;q=0.8' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36' -H 'content-type: application/json;charset=UTF-8' -H 'accept: application/json, text/plain, */*' -H 'referer: https://www.kia.com/us/en/inventory/result?zipCode=90001&seriesId=G&year=2019' -H 'authority: www.kia.com' -H 'sec-fetch-site: same-origin' -H 'custom-spinner: true' --data-binary '{"series":"G","year":"2019","zipCode":"90001"}' --compressed`
		@logger.info("Parsing json object of curl data of#{@make}")
		json_data  = JSON.parse(curl_data)
		data_of_arr = json_data["vehicles"]
		@logger.info("Found total listings - #{data_of_arr.size}")
		data_arr = []
		@logger.info("mapping parsed data to elaticsearch mapping terminology")
		data_of_arr.each{ |x|
			data_hash = {}
			data_hash = {
				:model => x["model"]["model"],
				:model_code => x["modelCode"],	
				:year => x["year"]["year"],
				:dealer_price => x["dealerPrice"],
				:exterior_discription => x["exteriorColor"]["description"],
				:interior_discription => x["interiorColor"]["description"],
				:engine_displacement => x["engineDisplacement"],
				:engine_cylinder => x["engineCylinders"]["engineCylinders"],
				:mileage => x["mileage"]
				}
				data_arr << {  index: {
		                            _index: 'vehicles' , _type: '_doc' , data: data_hash
        		              }
                }
		}
		@logger.info Rainbow("parsing done of #{@make} api").green
		return data_arr
	end
end