require "open-uri"

remote_base_url = "http://en.wikipedia.org/wiki"
remote_page_name = "Ada_Lovelace"
remote_full_url = remote_base_url + "/" + remote_page_name

remote_data = open(remote_full_url).read
my_local_file = open("my-downloaded-page.html", "w") 

my_local_file.write(remote_data)
my_local_file.close

require 'nokogiri'
require 'open-uri'
require 'csv'

# Store URL to be scraped
url = "https://www.airbnb.com/s/Brooklyn--NY--United-States"

# Parse the page with nokogiri
page = Nokogiri::HTML(open(url))

# Scrape the max number of pages and store in the max_page variable
page_numbers = []
 page.css("div.pagination ul li a[target]").each do |line|
	page_numbers << line.text
end


max_page = page_numbers.max

# Initialize empty arrays
name = []
price = []
details = []

# Loop once for every page search results
max_page.to_i.times do |i|

	# Open search results page
	url = "https://www.airbnb.com/s/Brooklyn--NY--United-States?page=#{i + 1}"
	page = Nokogiri::HTML(open(url))


# Stora data in arrays 
		
		 page.css('div.h5.listing-name').each do |line|
		 	name << line.text.strip
		 end

			page.css('span.h3.price-amount').each do |line|
		 	price << line.text
		 end
		 
			page.css('div.text-muted.listing-location.text-truncate').each do |line|
		 	subarray = line.text.strip.split(/ · /)

		 	if subarray.length == 3
		 		details << subarray
		 	else
		 		details << [subarray[0], "O reviews", subarray[1]]
		 	end
		 	
		 	
		 end

end



 # Write data to CSV file
  CSV.open("airbnb_listings.csv", "w") do |file|
 	file << ["Listings", "Price", "Room Type", "Reviews", "Location"]
 	
 	name.length.times do |i|
 		file << [name[i], price[i], details[i][0], details[i][1][0], details[i][2]]
 	end
 end


dates = []
File.open('yourfile.csv').each_line do |line|
  if m = line.match(/^\d\d\/\d\d\/\d\d/)
    dates.push m 
  end
end

puts dates


File.open('yourfile.csv').read.scan /\d{2}\/\d{2}\/\d{2}/

puts "Another brick in the wall".sub("brick in the", "")   #=>   "Another wall"


my_first_array = []
You can fill an array with any kind of data object:


my_first_array[0] = "Alpha"   
my_first_array[1] = "Beta"
my_first_array[2] = 3

# initializing and filling the array in one step:
my_first_array = ["Alpha", "Beta", 3]
Elements in arrays are accessed by addressing their numerical place in the array:

puts my_first_array[1]   
#=> Beta
Some common Array methods include reverse and length:

puts my_first_array.length
#=> 3

my_first_array = my_first_array.reverse
puts my_first_array.join(", ")   
#=> 3, Beta, Alpha         