#assignment 3

class String
	def titleize
		new_string = self.split(/\W+/)
 		new_string.map {|i| i.capitalize}.join(" ")
 	end
end

"hEllo WORld".titleize
"gooDbye CRuel wORLD".titleize

class String
	def palindrome?
		letters_only = self.gsub(/\W+/, "")
 		letters_only_downcase = letters_only.downcase
 		if letters_only_downcase == letters_only_downcase.reverse
 			return "true"
 		else
 			return "false"
 		end
 	end
end

"abba".palindrome?
"aBbA".palindrome?
"A man, a plan, a canal, Panama".palindrome?
"abb".palindrome?
"Able was I ere I saw elba".palindrome?
"A man, a plan, a canal, Panama".palindrome?

class Array
	def mean 
    sum = 0
    self.each {|n| sum += n}
    the_mean = sum/self.length.to_f
    return the_mean.to_f
 	end

 	def median
 		ordered_array = self.sort
 		number_of_elements = self.length
 		if number_of_elements % 2 != 0
 			median_position = number_of_elements.to_i/2
 			return ordered_array[median_position].to_f
 		else number_of_elements % 2 == 0
 			median1 = ordered_array[self.length.to_i/2]
 			median2 = ordered_array[self.length.to_i/2-1]
 			return (median1.to_f+median2.to_f)/2
 		end
 	end
end

[1,2,5,6].mean
[1,1,4].mean
[1,2,3].median
[1,1,4].median

class Array
  def to_sentence
		if self.length == 1
 			return self
 		elsif self.length > 1
 			last_element = []
 			last_element << self.pop
 			join_elements = self.flatten.join(", ")
		  return join_elements+" and "+last_element[0].to_s
		end
  end
end

[].to_sentence
["john"].to_sentence
["john", "paul"].to_sentence
[1, "paul", 3, "ringo"].to_sentence


#---------------- BANK

$STARTING_BALANCE = 0.0
$DEPOSITS = []
$WITHDRAWALS = []


def withdrawals
end

def deposits
end

def daily_balance
end

def summary
end




















