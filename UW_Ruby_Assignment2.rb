#UW Assignment #2

def to_sentence(array)
  if array.length == 1
  	puts array
  elsif array.length > 1
  	last_element = []
  	last_element << array.pop
  	p = array.flatten.join(", ")
  	puts p+" and "+last_element[0].to_s
  end
end

#to_sentence([])
#to_sentence(["john"])
#to_sentence(["john", "paul"])
#to_sentence([1, "paul", 3, "ringo"])

def mean(array)
	sum = 0
  array.each {|i| sum += i}
  the_mean = sum/array.length.to_i
  puts the_mean
end

def median(array)
  ordered_array = array.sort
  number_of_elements = array.length
  if array.length % 2 != 0
    median_pos = number_of_elements.to_i/2
    puts ordered_array[median_pos].to_f
  else array.length % 2 == 0
  	median1 = ordered_array[array.length.to_i/2]
  	median2 = ordered_array[array.length.to_i/2-1]
  	puts (median1.to_f+median2.to_f)/2
  end
end

#mean([1, 2, 3])
#mean([1, 1, 10])
#puts ""

#median([1, 2, 3])
#median([1, 1, 4])
#puts ""

def pluck(hash, target)
  number = 0
  if target == :name
    number = 0
  elsif target == :instrument
    number = 1
  end
  hash.each do |i|
    vals = i.values[number]
    output = []
    output<<vals
    puts output
  end
end

records = [{name: "John", instrument: "guitar"},
{name: "Paul", instrument: "bass"},
{name: "George", instrument: "guitar"},
{name: "Ringo", instrument: "drums"}]

pluck(records, :name)
puts ""
pluck(records, :instrument)












