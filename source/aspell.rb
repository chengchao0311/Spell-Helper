require 'rubygems'
require 'open-uri'
require 'nokogiri'

# Print out each link using a CSS selector
word = ARGV[0]
page = Nokogiri::HTML(open("http://suggest.aspell.net/index.php?word="+word+"&spelling=american&dict=normal&sugmode=slow"))   
result = "<items>"
links = page.css("a").css("a[target=aspell-def]")
links.each do |link| 
   result = result +  "<item valid='yes'><title>"+link.content+"</title><arg>"+link.content+"</arg><subtitle/><icon>icon.png</icon></item>"
end
result += "<items/>"
puts result

