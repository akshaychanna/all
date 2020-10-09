Thread.abort_on_exception = true
threads = []
10.times {
  threads << Thread.new { puts 1 }
}
threads.each { |n| n.join }
