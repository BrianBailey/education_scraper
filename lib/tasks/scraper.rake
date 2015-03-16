namespace :scraper do
  desc "Fetch posts from Sunlight api"
  task scrape: :environment do
  	require 'open-uri'
		require 'json'


# Set API token and URL
apikey = ""

# http://polling.3taps.com/poll
polling_url = "http://capitolwords.org/api/1/text.json"

#http://capitolwords.org/api/1/text.json?phrase=education&state=MO&page=1&apikey=8afe89c570dc484591ba42c38931b2b0


# Specify request parameters
params = {

		phrase: "education",
		state: "MO",
		page: "10",

		apikey: apikey
	
}

# Prepare API request
uri = URI.parse(polling_url)
uri.query = URI.encode_www_form(params)

# Submit request
result = JSON.parse(open(uri).read)

# Display results to screen
  # puts result["results"].first["speaker_state"]
  # puts JSON.pretty_generate result
  
  # Store results in database

        result["results"].each do |posting|

				# Create new Post
				@post = Post.new
				@post.speaker_state = posting["speaker_state"]
				@post.speaker_first = posting["speaker_first"]
				@post.speaker_last = posting["speaker_last"]
				@post.speaker_party = posting["speaker_party"]
				@post.speaking = posting["speaking"].join("")


				
				@post.chamber = posting["chamber"]
				@post.title = posting["title"]
				@post.date = posting["date"]
				

				#Maybe have the following on the show page page?
				
				@post.origin_url = posting["origin_url"]
				@post.number = posting["number"]
				@post.order = posting["order"]
				@post.volume = posting["volume"]
				@post.pages = posting["pages"]
				
				# @post.id = posting["id"]
 				
  			@post.bioguide_id = posting["bioguide_id"]
  			
  			@post.speaker_raw = posting["speaker_raw"]

				


 				# Save Post
				@post.save
	end
end

# require "open-uri"

# remote_base_url = "http://en.wikipedia.org/wiki"
# remote_page_name = "Ada_Lovelace"
# remote_full_url = remote_base_url + "/" + remote_page_name

# remote_data = open(remote_full_url).read
# my_local_file = open("my-downloaded-page.html", "w") 

# my_local_file.write(remote_data)
# my_local_file.close




  

  desc "Destroy all posting data"
  task destroy_all_posts: :environment do
  	Post.destroy_all
  end

end
