require 'logger'  
$LOG = Logger.new('app.log', 20, 'daily') 
 
def divide(numerator, denominator)  
  $LOG.debug("Numerator: #{numerator}, denominator #{denominator}")  
  begin  
    result = numerator / denominator 
	puts result 
  rescue Exception => e  
    $LOG.error "Error in division!: #{e}"  
    result = nil  
  end  
  return result  
end  
divide(10, 5)  
