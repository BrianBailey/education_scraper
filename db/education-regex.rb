

 require 'sqlite3'
 require 'twitter'

db = SQLite3::Database.new('development.sqlite3')
# db.results_as_hash = true
 # results = db.execute("SELECT * FROM 
	# posts WHERE speaker_last LIKE 'B%'")

# puts results[0].class

# puts "#{results[0]['speaker_last']} is speaking in #{results[0]['date']}, #{results[0]['chamber']}"

# speakers_last = ["Blunt", "Bond", "Akin"]
# speakers_last.each do |speaker_last|
#    res = db.execute("SELECT * FROM posts WHERE speaker_last LIKE ?", "#{speaker_last}%")
#    puts "Number of entries in #{speaker_last}: #{res.length}"
# end
# db.results_as_hash = true
results1 = db.execute("SELECT speaking FROM posts
	 WHERE speaker_last='Bond' AND chamber ='Senate'")
# results2 = db.execute("SELECT speaking FROM posts
# 	 WHERE speaker_last='McCaskill' AND chamber ='Senate'")

 bond_words =  results1.join(",").split
 # mccaskill_words = results2.join(",").split

freqs=Hash.new(0) 
bond_words.each { |word| freqs[word] += 1 } 
freqs.sort_by {|x,y| y }.reverse.each {|w, f| puts w+' '+f.to_s} 

# mccaskill_words.each { |word| freqs[word] += 1 } 
# freqs.sort_by {|x,y| y }.reverse.each {|w, f| puts w+' '+f.to_s} 

# puts bond_words - mccaskill_words
 [abc]	A single character of: a, b, or c
[^abc]	Any single character except: a, b, or c
[a-z]	Any single character in the range a-z
[a-zA-Z]	Any single character in the range a-z or A-Z
^	Start of line
$	End of line
\A	Start of string
\z	End of string
.	Any single character
\s	Any whitespace character
\S	Any non-whitespace character
\d	Any digit
\D	Any non-digit
\w	Any word character (letter, number, underscore)
\W	Any non-word character
\b	Any word boundary
(...)	Capture everything enclosed
(a|b)	a or b
a?	Zero or one of a
a*	Zero or more of a
a+	One or more of a
a{3}	Exactly 3 of a
a{3,}	3 or more of a
a{3,6}	Between 3 and 6 of a  








# require 'sqlite3'
#  require 'twitter'




# db = SQLite3::Database.new('development.sqlite3')
# # db.results_as_hash = true
#  # results = db.execute("SELECT * FROM 
# 	# posts WHERE speaker_last LIKE 'B%'")

# # puts results[0].class

# # puts "#{results[0]['speaker_last']} is speaking in #{results[0]['date']}, #{results[0]['chamber']}"

# # speakers_last = ["Blunt", "Bond", "Akin"]
# # speakers_last.each do |speaker_last|
# #    res = db.execute("SELECT * FROM posts WHERE speaker_last LIKE ?", "#{speaker_last}%")
# #    puts "Number of entries in #{speaker_last}: #{res.length}"
# # end
# # db.results_as_hash = true
# results = db.execute("SELECT speaking FROM posts
# 	 WHERE speaker_last='Bond' AND chamber ='Senate'")

#  bond_words =  results.join(",").split

# freqs=Hash.new(0) 
# bond_words.each { |word| freqs[word] += 1 } 
# freqs.sort_by {|x,y| y }.reverse.each {|w, f| puts w+' '+f.to_s} 

# require 'sqlite3'


# DBNAME = "twitter-stream.sqlite"
# File.delete(DBNAME) if File.exists?DBNAME

# DB = SQLite3::Database.new( DBNAME )
# DB.execute("CREATE TABLE testdata(class_name, method_name)")

# Looping through some Ruby data classes

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
 
# require 'rubygems'
require 'twitter'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "Y6FtylshXJl55AwDJdzJ6u2TD"
  config.consumer_secret     = "EttXMqd3l939LpzyCBXlrRoE7irZ4NjwopRI5iH2XteV7ZPrQx"
  config.access_token        = "2276085372-v262ARAHw1w8MNBT2iPnLazRS3sXSMkSmDyXZuo"
  config.access_token_secret = "im7FG5I7RVVwYjOcywV4ZVJaxyCQMVp4kUqUG9aUZwgiD"
end

topics = ["Education", "St Louis", "Ted Cruz "]
client.filter(:track => topics.join(",")) do |object|
  results = object.text if object.is_a?(Twitter::Tweet)
  puts results
  sleep(2)
end
























