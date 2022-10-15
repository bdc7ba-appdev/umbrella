require "open-uri" #basically synonymous with URL, this would normally get stacked at the top of the pile
require "json"

p "Hello, where are you located"
# user_location = gets.chomp #getting the location and removing /n from the end
user_location = "Chicago" #hardcode so you don't have to type over testing 

# gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + user_location + "&key=AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U"

gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U"



raw_gmaps_data = URI.open(gmaps_url).read #returns a lot of stuff, we are interested in the actual content which is what .read does
formatted_gmaps_data = JSON.parse(raw_gmaps_data)

geo = formatted_gmaps_data.fetch("results").at(0).fetch("geometry")
lat = geo.fetch("location").fetch("lat")
long = geo.fetch("location").fetch("lng")
dark_sky_url = "https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/#{lat},#{long}"

raw_dark_sky_data = URI.open(dark_sky_url).read
p raw_dark_sky_data
formatted_dark_sky_data = JSON.parse(raw_dark_sky_data)





# p user_latitude = formatted_gmaps_data.fetch("results").at(0).fetch("geometry").fetch("location").fetch("lat") #below results it is an array
# p user_longtitude = formatted_gmaps_data.fetch("results").at(0).fetch("geometry").fetch("location").fetch("lng")
