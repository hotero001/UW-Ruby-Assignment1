#just tests

# def titleize
#   a = split(" ")
#   b = a.map {|x| x.upcase[0]+x[1..-1].downcase}
#   puts b.join(" ")
# end


# titleize("hEllo WORLD")
# titleize("gooDbye CRUel wORLD")
# puts ""


# def my_reverse(s)
#   index = s.length
#   array = []
#   s.length.times do index -= 1 
#     array << s[index]
#     if array.length == s.length
#       puts array.join
#     end
#   end
# end

# my_reverse("Hello World")
# my_reverse("Goodbye Cruel World")
# puts ""

# def palindrome?(s)
# 	g = s.gsub(/\W+/, "")
#   f = g.downcase
#   if f.reverse == f
#     puts "true"
#   else
#     puts "false"
#   end 
# end

# palindrome?("abba")
# palindrome?("aBba")
# palindrome?("abb")
# palindrome?("Able was I ere I saw elba")
# palindrome?("A man, a plan, a canal, Panama")

class Perfection
	def self.instance
		@instance ||= Perfection.new
	end

	def isPerfect(candidate)
		retVal = nil
		divisors = GetDivisors(candidate)
		sum = 0
		for d in 0..1000 do
			sum = sum + divisors[d]
		end
		if sum == candidate
			retVal = true
		end
		return retVal
	end

  def GetDivisors(candidate)
  	divisors = Array.new(1000)
  	d = 0
  	for i in 0..candidate {
  		foo = candidate/i
  		if foo*i == candidate
  			divisors[d] = i
  			d = d + 1
  		end
  	}
    return divisors
  end
end

n = gets
puts Perfection.isPerfect(7)







