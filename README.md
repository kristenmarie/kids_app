# Super Duper Kids Learning Center

#### _Ruby Group Project, 10/04/17_

#### By Megan Olson, Kristen Kulha, Linda Luu, and Snow Vilay

## Description

_A Web Application that allows the user (children) create an account with their name and age to gain access to educational games and activities while tracking their progress._

## Setup/Installation Requirements

* Clone this repository
* Open file kids_app
* Copy database using ActiveRecord
* Run ruby app.rb to open the app in Sinatra
* Open your preferred browser and go to 'localhost:4567' to view project

## Specifications

* Program create a new account when credentials are entered and see activities available for their age range.
  * Example Input: (Name: "Sue", Age: 8)
  * Example Output: "Welcome Sue!"
* Program create a new account when credentials are entered and see activities available for their age range.
  * Example Input: (Name: "Sue", Age: 8)
  * Example Output: "Welcome Sue! Choose a game to play."
* Program will display 'Alphabet', 'Numbers', and 'Colors' if user is under the age of 7.
  * Example Input: (Name: "Bob", Age: 5)
  * Example Output: "'Numbers', 'Alphabet', 'Colors'"
* Program will display 'Basic Math', 'Spelling', and 'Animal Science' if user is over the age of 6.
  * Example Input: (Name: "Sue", Age: 8)
  * Example Output: "'Basic Math', 'Spelling', 'Animal Science'"
* Program will allow users under the age of 7 to input letters and add words to each letter and increase score by 1.
  * Example Input: click "A"
  * Example Output: "apple"
* Program will display error page when word is inputted beginning with wrong letter.
  * Example Input: "bear"
  * Example Output: "Try again."
* Program allows user to update inputted word.
  * Example Input: "bears"
  * Example Output: "bears"
* Program allows user to delete inputted word.
  * Example Input: "bears"
  * Example Output: ""
* Program will allow users under the age of 7 to input answers in numbers game and increase score by 1 if correct.
  * Example Input: 1
  * Example Output: Score += 1
* Program will display error page when answer is incorrect for Numbers Game.
  * Example Input: "2"
  * Example Output: "Oops! Incorrect."
* Program displays congratulations page when all five pages are completed.
  * Example Input: Score += 5
  * Example Output: "Congratulations!"
* Program will allow users under the age of 7 to input answers in colors game and increase score by 1 if correct.
  * Example Input: "Yellow"
  * Example Output: Score += 1
* Program will display error page when answer is incorrect for Colors Game.
  * Example Input: "red"
  * Example Output: "Oops! Incorrect. Try again."
* Program displays congratulations page when all five pages are completed.
  * Example Input: Score += 5
  * Example Output: "Congratulations!"
* Program allows user to track and view progress in games and see overall score.
  * Example Input: click "progress"
  * Example Output: bar graph
* Program will allow users over the age of 6 to input answers in math game and increase score by 1 if correct.
  * Example Input: "10"
  * Example Output: Score += 1
* Program will display error page when answer is incorrect for Math Game.
  * Example Input: "2"
  * Example Output: "Oops! Incorrect. Try Again."
* Program displays congratulations page when all five pages are completed.
  * Example Input: Score += 5
  * Example Output: "Congratulations!"
* Program will allow users over the age of 6 to input answers in spelling game and increase score by 1 if correct.
  * Example Input: "frog"
  * Example Output: Score += 1
* Program will display error page when answer is incorrect for Spelling Game.
  * Example Input: "lyon"
  * Example Output: "Oops! Incorrect. Try Again."
* Program displays congratulations page when all five pages are completed.
  * Example Input: Score += 5
  * Example Output: "Congratulations!"
* Program will allow users over the age of 6 to input answers in animal science game and increase score by 1 if correct.
  * Example Input: "Ccean"
  * Example Output: Score += 1
* Program will display error page when answer is incorrect for animal science Game.
  * Example Input: "Desert"
  * Example Output: "Oops! Incorrect. Try Again."
* Program displays congratulations page when all five pages are completed.
  * Example Input: Score += 5
  * Example Output: "Congratulations!"
* Program allows user to track and view progress in games and see overall score.
  * Example Input: click "progress"
  * Example Output: bar graph
* Program allows user to log out of account when finished and log back in with saved credentials.
  * Example Input: click "log out"
  * Example Output: home page



## Support and contact details

_Please contact Megan at meganannetteolson@yahoo.com, Kristen at  , Linda at linda.luu1226@gmail.com , or Snow at with questions, comments, or issues._

## Technologies Used

* Ruby
* Sinatra
* ActiveRecord

### License

Copyright (c) 2017 **Megan Olson, Kristen Kuhla, Linda Luu, Snow Vilay**

*This software is licensed under the MIT license.*
