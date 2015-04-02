# require 'sqlite3'




# db = SQLite3::Database.new('development.sqlite3')
#  db.results_as_hash = true
# #  results = db.execute("SELECT * FROM 
# #   posts WHERE speaker_last LIKE 'B%'")

# # puts results[0].class

# # puts "#{results[0]['speaker_last']} is speaking in #{results[0]['date']}, #{results[0]['chamber']}"

# speakers_last = ["Blunt", "Bond", "Akin"]
# speakers_last.each do |speaker_last|
#    res = db.execute("SELECT * FROM posts WHERE speaker_last LIKE ?", "#{speaker_last}%")
#    puts "Number of entries in #{speaker_last}: #{res.length}"
#    puts res.class
# end
# db.results_as_hash = true
# results = db.execute("SELECT speaking FROM posts
#    WHERE speaker_last='Bond' AND chamber ='Senate'")

#  puts results.class
 







# require 'sqlite3'

# db = SQLite3::Database.new('sp500-data.sqlite')

# LETTERS = ('A'..'Z').to_a

# 10.times do
#    random_letters = LETTERS.shuffle.first(rand(10) + 1)
#    q = random_letters.map{"name LIKE ?"}.join(' OR ')
#    res = db.execute("SELECT COUNT(1) from companies WHERE #{q}", random_letters.map{|r| "#{r}%"})
#    puts "There are #{res} companies with names that begin with #{random_letters.sort.join(', ')}"
# end


# require 'rubygems'
# require 'sqlite3'

# DBNAME = "ca-common-surgeries.sqlite"
# DB = SQLite3::Database.open( DBNAME )
# TABLE_NAME = "surgery_records"

# procedures = DB.execute("SELECT DISTINCT procedure from surgery_records")
# q="SELECT hospital, discharge_count, median_charge_per_stay FROM surgery_records WHERE 
# discharge_count >= 25 AND median_charge_per_stay > 0 AND year = 2009 AND procedure=? ORDER by hospital"

# outs = File.open("procedures-all-hospitals-cost-vs-discharges.csv", 'w')
# outs.puts ""
# procedures.each do |procedure|
#   chd = DB.execute(q, procedure).inject([[],[]]){ |arr, row|
#      arr[0] << row[1]
#      arr[1] << row[2]   
#      arr
#   }.map{|a| a.join(',')}.join('|')
#   g_url = "http://chart.googleapis.com/chart?cht=s&chs=500x300&chds=a&chxt=x,y&chd=t:#{chd}"

#    outs.puts "


#    




require 'sqlite3'
require 'twitter'
require 'sqlite3'

# require 'rubygems'
# require 'twitter'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "Y6FtylshXJl55AwDJdzJ6u2TD"
  config.consumer_secret     = "EttXMqd3l939LpzyCBXlrRoE7irZ4NjwopRI5iH2XteV7ZPrQx"
  config.access_token        = "2276085372-v262ARAHw1w8MNBT2iPnLazRS3sXSMkSmDyXZuo"
  config.access_token_secret = "im7FG5I7RVVwYjOcywV4ZVJaxyCQMVp4kUqUG9aUZwgiD"
end

topics = ["education", "St Louis", "Ted Cruz"]
client.filter(:track => topics.join(",")) do |object|
  results = object.text if object.is_a?(Twitter::Tweet)
  puts results.class
  sleep(2)
end


 DBNAME = "education-st-louis-cruz.sqlite"
 File.delete(DBNAME) if File.exists?DBNAME

 DB = SQLite3::Database.new( DBNAME )
 DB.execute("CREATE TABLE testdata(streaming)")

 # Looping through some Ruby data classes

 # This is the same insert query we'll use for each insert statement
 insert_query = "INSERT INTO testdata(streaming) VALUES(?)"

# [Numeric, String, Array, IO, Kernel, SQLite3, NilClass, MatchData].each do |klass|
#   puts "Inserting methods for #{klass}"

#   # a second loop: iterate through each method
#   klass.methods.each do |method_name|
#     # Note: method_name is actually a Symbol, so we need to convert it to a String
#     # via .to_s
#     DB.execute(insert_query, klass.to_s, method_name.to_s)
#   end
# end


# ## Select record count
# q = "SELECT COUNT(1) FROM testdata"
# results = DB.execute(q)
# puts "\n\nThere are #{results} total entries\n"

# ## Select 20 longest method names
# puts "Longest method names:"
# q = "SELECT * FROM testdata
# ORDER BY LENGTH(method_name)
# DESC LIMIT 20"
# results = DB.execute(q)

# # iterate
# results.each do |row|
#   puts row.join('.')
# end


# ## Select most common methods
# puts "\nMost common method names:"
# q = "SELECT method_name, COUNT(1) AS mcount FROM testdata GROUP BY method_name ORDER BY mcount DESC, LENGTH(method_name) DESC LIMIT 10"
# results = DB.execute(q)
# # iterate
# results.each do |row|
#   puts row.join(": ")
# end













# require 'sqlite3'


# DBNAME = "hello.sqlite"
# File.delete(DBNAME) if File.exists?DBNAME

# DB = SQLite3::Database.new( DBNAME )
# DB.execute("CREATE TABLE testdata(class_name, method_name)")

# # Looping through some Ruby data classes

# # This is the same insert query we'll use for each insert statement
# insert_query = "INSERT INTO testdata(class_name, method_name) VALUES(?, ?)"

# [Numeric, String, Array, IO, Kernel, SQLite3, NilClass, MatchData].each do |klass|
#   puts "Inserting methods for #{klass}"

#   # a second loop: iterate through each method
#   klass.methods.each do |method_name|
#     # Note: method_name is actually a Symbol, so we need to convert it to a String
#     # via .to_s
#     DB.execute(insert_query, klass.to_s, method_name.to_s)
#   end
# end


# ## Select record count
# q = "SELECT COUNT(1) FROM testdata"
# results = DB.execute(q)
# puts "\n\nThere are #{results} total entries\n"

# ## Select 20 longest method names
# puts "Longest method names:"
# q = "SELECT * FROM testdata
# ORDER BY LENGTH(method_name)
# DESC LIMIT 20"
# results = DB.execute(q)

# # iterate
# results.each do |row|
#   puts row.join('.')
# end


# ## Select most common methods
# puts "\nMost common method names:"
# q = "SELECT method_name, COUNT(1) AS mcount FROM testdata GROUP BY method_name ORDER BY mcount DESC, LENGTH(method_name) DESC LIMIT 10"
# results = DB.execute(q)
# # iterate
# results.each do |row|
#   puts row.join(": ")
# end