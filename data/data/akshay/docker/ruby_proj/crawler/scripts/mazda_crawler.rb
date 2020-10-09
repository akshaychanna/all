require 'logger'
require 'rainbow'

class MazdaCrawler
	
	def initialize(make)
		@make = make
		@logger = Logger.new(STDOUT)
	end

	def get_data
		@logger.info Rainbow("Getting curl data of #{@make} api").green
		curl_data = `curl 'https://www.mazdausa.com/api/inventorysearch' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Referer: https://www.mazdausa.com/shopping-tools/inventory/results' -H 'Origin: https://www.mazdausa.com' -H 'X-Requested-With: XMLHttpRequest' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.75 Safari/537.36' -H 'Sec-Fetch-Mode: cors' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' --data 'ResultsPageSize=12&ResultsParameterFilter=&ResultsSortAttribute=Year&ResultsSortOrder=asc&ResultsStart=1&TimeSearchPerformed=&Vehicle%5BDealerId%5D%5B%5D=42166&Vehicle%5BDealerId%5D%5B%5D=42176&Vehicle%5BDealerId%5D%5B%5D=42031&Vehicle%5BStatus%5D%5B%5D=11&Vehicle%5BType%5D%5B%5D=n&Vehicle%5BYear%5D%5B%5D=2020&Vehicle%5BCarline%5D%5B%5D=m3h&Vehicle%5Byear%5D%5B%5D=2020&Vehicle%5BsortTitle%5D%5B%5D=Distance%3A+Near+to+Far&Vehicle%5Bcond%5D%5B%5D=n&resultsSortParameter%5B0%5D%5BresultsSortAttribute%5D=DEALERID&resultsSortParameter%5B0%5D%5BresultsSortOrder%5D=asc&resultsSortParameter%5B1%5D%5BresultsSortAttribute%5D=price&resultsSortParameter%5B1%5D%5BresultsSortOrder%5D=asc&resultsSortParameter%5B2%5D%5BresultsSortAttribute%5D=Year&resultsSortParameter%5B2%5D%5BresultsSortOrder%5D=desc&resultsSortParameter%5B3%5D%5BresultsSortAttribute%5D=Mileage&resultsSortParameter%5B3%5D%5BresultsSortOrder%5D=asc&sortVal=DEALERID%7Casc%2Cprice%7Casc%2CYear%7Cdesc%2CMileage%7Casc&sortTitle=Distance%3A+Near+to+Far' --compressed`
		@logger.info("Parsing json object of curl data of#{@make}")
		json_data  = JSON.parse(curl_data)
		data_of_arr = json_data["response"]["Vehicles"]
		@logger.info("Found total listings - #{data_of_arr.size}")
		data_arr = []
		@logger.info("mapping parsed data to elaticsearch mapping terminology")
		data_of_arr.each{ |x|
			data_hash = {}
			data_hash = {
				:model => x["Model"]["Name"],
				:model_code => x["Model"]["Code"],
				:year => x["Model"]["Year"],
				:dealer_price => x["Price"],
				:exterior_discription => x["Colors"]["ExteriorDescription"],
				:interior_discription => x["Colors"]["InteriorDescription"],
				:engine_displacement => x["Model"]["Engine"]["DisplacementCc"],
				:engine_cylinder => x["Model"]["Engine"]["CylinderType"],
				:mileage => x["Mileage"]
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