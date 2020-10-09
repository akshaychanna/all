pages_to_crawl = %w( index about contact ... )
pages_to_crawl.each do |page|
  Thread.new { puts page }
end
threads.each { |n| n.join }
