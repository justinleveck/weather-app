require 'features_helper'

describe 'Searching for city temp' do
  it 'is successful' do
    response = "{\"coord\":{\"lon\":-118,\"lat\":33.68},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"base\":\"stations\",\"main\":{\"temp\":81.41,\"pressure\":1011,\"humidity\":62,\"temp_min\":71.06,\"temp_max\":95},\"visibility\":16093,\"wind\":{\"speed\":11.41,\"deg\":210},\"clouds\":{\"all\":1},\"dt\":1536612960,\"sys\":{\"type\":1,\"id\":485,\"message\":0.0152,\"country\":\"US\",\"sunrise\":1536586360,\"sunset\":1536631438},\"id\":5358705,\"name\":\"Huntington Beach\",\"cod\":200}"

    stub_request(:get, "http://api.openweathermap.org/data/2.5/weather?APPID=123abc&q=Huntington%20Beach&units=imperial").
      to_return(status: 200, body: response, headers: {})

    visit '/'

    fill_in 'q',  with: 'Huntington Beach'

    click_button 'Submit'

    page.body.must_include('Huntington Beach')
    page.body.must_include('81')
  end
end