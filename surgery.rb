require 'rubygems'
require 'rubygems'
require 'sqlite3'

DBNAME = "ca-common-surgeries.sqlite"
DB = SQLite3::Database.open( DBNAME )
TABLE_NAME = "surgery_records"

q = "SELECT procedure, SUM(discharge_count) 
   FROM #{TABLE_NAME} 
   GROUP BY procedure 
   ORDER by procedure DESC"

results = DB.execute(q)   
procedures = results.map{|row| row[0].split(' ').map{|s| s[0..3]}[0..2].join.gsub(/[^\w]/,'')}            
discharge_counts = results.map{|row| row[1]}   

G_URL = "https://chart.googleapis.com/chart?cht=bhs&chs=400x600&chds=a&chbh=10&chxt=x,y"
puts "#{G_URL}&chd=t:#{discharge_counts.join(',')}&chxl=1:|#{procedures.join('|')}"    

require 'rss'

rss = RSS::Parser.parse('https://sunlightfoundation.com/blog/rss/',false)
rss.items.each do |item|
	puts "#{item.pubDate} - #{item.title}"
end


equire "net/http"
require "uri"
require 'json'
 
uri = URI.parse("https://api.monkeylearn.com/api/v1/categorizer/cl_zD7UNmJE/classify_text/")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Post.new(uri.request_uri)
 


# Set POST data


request.body = {text: "This is a text to test the API."}.to_json


# Set headers
request.add_field("Content-Type", "application/json")
request.add_field("Authorization", "token f83dd3a972990653b0122b3789b8f3531b58dd03")
 
puts(http.request(request).body)  



contracts_arr =    
   ["Hughes Missile Systems Company, Tucson, Arizona, is being awarded a $7,311,983 modification to a firm fixed price contract for the FY94 TOW missile production buy, total 368 TOW 2Bs. Work will be performed in Tucson, Arizona, and is expected to be completed by April 30, 1996. Of the total contract funds, $7,311,983 will expire at the end of the current fiscal year. This is a sole source contract initiated on January 14, 1991. The contracting activity is the U.S. Army Missile Command, Redstone Arsenal, Alabama (DAAH01-92-C-0260).",
   "Conventional Munitions Systems, Incorporated, Tampa, Florida, is being awarded a $6,952,821 modification to a firm fixed price contract for Dragon Safety Circuits Installation and retrofit of Dragon I Missiles with Dragon II Warheads. Work will be performed in Woodberry, Arkansas (90%), and Titusville, Florida (10%), and is expected to be completed by May 31, 1996. Contract funds will not expire at the end of the current fiscal year. This is a sole source contract initiated on May 2, 1994. The contracting activity is the U.S. Army Missile Command, Redstone Arsenal, Alabama (DAAH01-94-C-S076)."]

   contracts_arr.each do |contract|
   mtch = contract.match(/\$[\d,]+/)
   puts mtch
end

#=> $7,311,983
#=> $6,952,821

contracts_arr.each do |contract|
   mtch = contract.match(/\w+ \d{1,2}, \d{4}/)
   puts mtch
end
#=> April 30, 1996
#=> May 31, 1996
contracts_arr.each do |contract|
   mtch = contract.match(/\b(.{10,20}) (\w+ \d{1,2}, \d{4})/)
   puts "#{mtch[1]} \t\t #{mtch[2]}"
end

#=> to be completed by        April 30, 1996
#=> to be completed by        May 31, 1996