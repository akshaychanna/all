print "enter any nubmber between 1-100:"
val=gets.chomp.to_i
p val 
def call(val)
  case val
  when 1..10
	p "bet 1-10"
  when 11..20
	 p "bet 11-20"
  else
	p "other"
  end
end

call(val)
