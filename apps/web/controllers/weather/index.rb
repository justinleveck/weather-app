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
      @city = JSON.parse(response)
    end
  end
end
