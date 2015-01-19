#just tests

def titleize(s)
  a = s.split(" ")
  b = a.map {|x| x.upcase[0]+x[1..-1].downcase}
  puts b.join(" ")
end

titleize("hEllo WORLD")
titleize("gooDbye CRUel wORLD")
puts ""

def my_reverse(s)
  index = s.length
  array = []
  s.length.times do index -= 1 
    array << s[index]
    if array.length == s.length
      puts array.join
    end
  end
end

my_reverse("Hello World")
my_reverse("Goodbye Cruel World")
puts ""

def palindrome?(s)
  g = s.gsub(/\W+/, "")
  f = g.downcase
  if f.reverse == f
    puts "true"
  else
    puts "false"
  end 
end

palindrome?("abba")
palindrome?("aBba")
palindrome?("abb")
palindrome?("Able was I ere I saw elba")
palindrome?("A man, a plan, a canal, Panama")
