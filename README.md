# Weather Challenge

Please implement the following:

An application that uses http://openweathermap.org/appid

Story:
As a User
When I type in the name of a city
And I click submit
Then I see the temperature in Fahrenheit

Bonus Points:
Setup the application with AWS (free tier).

# Solution

This is an app using [Ruby](https://www.ruby-lang.org), [Hanami](https://hanamirb.org) and [OpenWeatherMap](https://openweathermap.org/api) to display the temperature for a given city in fahrenheit.

## Getting started

To run this app locally add your OpenWeatherMap API key to the `.env.development` file:

```
OPEN_WEATHER_MAP_APPID="API_KEY"
```

## Setup

How to run tests:

```
% bundle exec rake
```

How to run the development console:

```
% bundle exec hanami console
```

How to run the development server:

```
% bundle exec hanami server
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% bundle exec hanami db prepare

% HANAMI_ENV=test bundle exec hanami db prepare
```

Explore Hanami [guides](http://hanamirb.org/guides/), [API docs](http://docs.hanamirb.org/1.2.0/), or jump in [chat](http://chat.hanamirb.org) for help. Enjoy! 🌸
