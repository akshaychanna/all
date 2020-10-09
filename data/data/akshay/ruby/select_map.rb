movies = [
  {id: 1, title: "Die Hard", rating: 4.0},
  {id: 2, title: "Bad Boys", rating: 5.0},
  {id: 3, title: "The Chamber", rating: 3.0},
  {id: 4, title: "Fracture", rating: 2.0}
]

p b_movies=movies.select{|movie| movie[:title].downcase.include?("b")}.map{|movie| movie[:id]}

puts "ll"

p b_movies


p b=movies.select{ |movie| movie[:title].downcase.include?("d")}.map{ |movie| movie[:title].downcase}
