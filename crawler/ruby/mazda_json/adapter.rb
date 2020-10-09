require 'logger'
require 'rainbow'

class Adapter
	def initialize()
		@logger = Logger.new(STDOUT)
	end

	def hello()
		print(" in hello fun")
	end

	def get_data()
		@logger.info Rainbow("Getting curl data from mazda api").green
		curl_data = `curl 'https://www.mazdausa.com/api/inventorysearch' \
					  -H 'authority: www.mazdausa.com' \
					  -H 'accept: application/json, text/javascript, */*; q=0.01' \
					  -H 'x-requested-with: XMLHttpRequest' \
					  -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.89 Safari/537.36' \
					  -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
					  -H 'origin: https://www.mazdausa.com' \
					  -H 'sec-fetch-site: same-origin' \
					  -H 'sec-fetch-mode: cors' \
					  -H 'sec-fetch-dest: empty' \
					  -H 'referer: https://www.mazdausa.com/shopping-tools/inventory/results' \
					  -H 'accept-language: en-IN,en-GB;q=0.9,en-US;q=0.8,en;q=0.7' \
					  --data-raw 'ResultsPageSize=370&ResultsParameterFilter=&ResultsSortAttribute=Year&ResultsSortOrder=asc&ResultsStart=1&TimeSearchPerformed=&Vehicle%5BDealerId%5D%5B%5D=23466&Vehicle%5BDealerId%5D%5B%5D=23454&Vehicle%5BDealerId%5D%5B%5D=23716&Vehicle%5BStatus%5D%5B%5D=11&Vehicle%5BType%5D%5B%5D=n&Vehicle%5BsortTitle%5D%5B%5D=Distance%3A+Near+to+Far&Vehicle%5Bcond%5D%5B%5D=n&resultsSortParameter%5B0%5D%5BresultsSortAttribute%5D=DEALERID&resultsSortParameter%5B0%5D%5BresultsSortOrder%5D=asc&resultsSortParameter%5B1%5D%5BresultsSortAttribute%5D=price&resultsSortParameter%5B1%5D%5BresultsSortOrder%5D=asc&resultsSortParameter%5B2%5D%5BresultsSortAttribute%5D=Year&resultsSortParameter%5B2%5D%5BresultsSortOrder%5D=desc&resultsSortParameter%5B3%5D%5BresultsSortAttribute%5D=Mileage&resultsSortParameter%5B3%5D%5BresultsSortOrder%5D=asc&sortVal=DEALERID%7Casc%2Cprice%7Casc%2CYear%7Cdesc%2CMileage%7Casc&sortTitle=Distance%3A+Near+to+Far' \
					  --compressed`
		json_data  = JSON.parse(curl_data)
		data_of_arr = json_data["response"]["Vehicles"]
		binding.pry
		@logger.info("Parsing json object of curl data of Mazda")
		
 	end
end


