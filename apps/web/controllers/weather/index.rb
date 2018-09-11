module Web::Controllers::Weather
  class Index
    include Web::Action
    expose :city

    def call(params)
    end

    def city
      return unless params[:q]

      require 'net/http'

      city = params[:q]
      url = "http://api.openweathermap.org/data/2.5/weather?q=#{URI.encode(city)}&units=imperial&APPID=#{ENV['OPEN_WEATHER_MAP_APPID']}"
      uri = URI(url)
      response = Net::HTTP.get(uri)
      # response = "{\"coord\":{\"lon\":-118,\"lat\":33.68},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"base\":\"stations\",\"main\":{\"temp\":82.51,\"pressure\":1011,\"humidity\":62,\"temp_min\":71.06,\"temp_max\":95},\"visibility\":16093,\"wind\":{\"speed\":11.41,\"deg\":210},\"clouds\":{\"all\":1},\"dt\":1536612960,\"sys\":{\"type\":1,\"id\":485,\"message\":0.0152,\"country\":\"US\",\"sunrise\":1536586360,\"sunset\":1536631438},\"id\":5358705,\"name\":\"Huntington Beach\",\"cod\":200}"
      @city = JSON.parse(response)
    end
  end
end
