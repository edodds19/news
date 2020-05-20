require "sinatra"
require "sinatra/reloader"
require "httparty"
def view(template); erb template.to_sym; end

# forecast is now a Hash you can pretty print (pp) and parse for your output

get "/" do

  ### Get the weather
  # Evanston, Kellogg Global Hub... replace with a different location if you want
  lat = 42.0574063
  long = -87.6722787
  location = "Evanston, Ill."

  units = "imperial" # or metric, whatever you like
  key = "9db3894e9258363098180a46b9f90c73" # replace this with your real OpenWeather API key


    weather_url = "https://api.openweathermap.org/data/2.5/onecall?lat=42.0574063&lon=-87.6722787&units=imperial&appid=9db3894e9258363098180a46b9f90c73"
    forecast = HTTParty.get(weather_url).parsed_response.to_hash

    news_url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=4991c8df449f4d7b8bfd350a023902d8"
    news = HTTParty.get(news_url).parsed_response.to_hash

  # construct the URL to get the API data (https://openweathermap.org/api/one-call-api)
  # url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{long}&units=#{units}&appid=#{key}"

  # make the call
  @location = location
  
  @current_temp = forecast["current"]["temp"]
  @current_description = forecast["current"]["weather"][0]["description"]

  @today_high = forecast ["daily"][0]["temp"]["max"]  
  @today_low = forecast ["daily"][0]["temp"]["min"]
  @today_description = forecast ["daily"][0]["weather"][0]["description"] 
  
  @tomorrow_high = forecast ["daily"][1]["temp"]["max"]  
  @tomorrow_low = forecast ["daily"][1]["temp"]["min"]
  @tomorrow_description = forecast ["daily"][1]["weather"][0]["description"]

  @day2_high = forecast ["daily"][2]["temp"]["max"]  
  @day2_low = forecast ["daily"][2]["temp"]["min"]
  @day2_description = forecast ["daily"][2]["weather"][0]["description"]

  @day3_high = forecast ["daily"][3]["temp"]["max"]  
  @day3_low = forecast ["daily"][3]["temp"]["min"]
  @day3_description = forecast ["daily"][3]["weather"][0]["description"]

  @day4_high = forecast ["daily"][4]["temp"]["max"]  
  @day4_low = forecast ["daily"][4]["temp"]["min"]
  @day4_description = forecast ["daily"][4]["weather"][0]["description"]

  ### Get the news of the day
  
  @title0 = news ["articles"][0]["title"]
  @url0 = news ["articles"][0]["url"]
  @description0 = news ["articles"][0]["description"]

  @title1 = news ["articles"][1]["title"]
  @url1 = news ["articles"][1]["url"]
  @description1 = news ["articles"][1]["description"]

  @title2 = news ["articles"][2]["title"]
  @url2 = news ["articles"][2]["url"]
  @description2 = news ["articles"][2]["description"]

  @title3 = news ["articles"][3]["title"]
  @url3 = news ["articles"][3]["url"]
  @description3 = news ["articles"][3]["description"]

  @title4 = news ["articles"][4]["title"]
  @url4= news ["articles"][4]["url"]
  @description4 = news ["articles"][4]["description"]


  view "news"

end
