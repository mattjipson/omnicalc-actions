require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather
    @lat = params.fetch("user_latitude").strip
    @lng = params.fetch("user_longitude").strip

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================

    # google_url = ("https://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_street_address)
    # parsed_google = JSON.parse(open(google_url).read)
    
    # lat = parsed_google.dig("results",0,"geometry","location","lat")
    # lng = parsed_google.dig("results",0,"geometry","location","lng")
    
    weather_url = ("https://api.darksky.net/forecast/5d1f2e54f5aefe7eba8f49637e98a3a7/"+ @lat.to_s + "," + @lng.to_s)
    parsed_weather = JSON.parse(open(weather_url).read)
    
    @current_temperature = parsed_weather.dig("currently", "temperature")

    @current_summary = parsed_weather.dig("currently", "summary")

    @summary_of_next_sixty_minutes = parsed_weather.dig("minutely", "summary")

    @summary_of_next_several_hours = parsed_weather.dig("hourly", "summary")

    @summary_of_next_several_days = parsed_weather.dig("daily", "summary")

    render("forecast/coords_to_weather.html.erb")
  end
end
