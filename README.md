# README

**To use Environmental Variable of the 'figaro' Gem**
1. "Bundle Install" 
2. Execute "bundle exec figaro install" in terminal

-This creates a commented config/application.yml file and adds it to your .gitignore. Add your own configuration to this file and you're done!

3. In config/application.yml, add "API_KEY: XXXXXXXXX" (Which the value should be the actual API Key for OpenWeather)

**How the WeatherAPI routing work**
1. When new user is signed-up, redirect to "check_weather" to search for a location
2. If location is correct and usable, redirect back to "UserDatum/new"
3. In this controller, location selected is stored as a global variable "$location" to be accessed by "UserDatum/create"
4. Then after an initial or new UserDatum is created, the initial UserDailyQuestionnaire will be created
by copying scores from UserDatum and the global "$location" as its "location" field.
5. Redirect back to home page is UDQ and UD is set.

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
