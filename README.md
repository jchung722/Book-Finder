# Book-Finder

## Goals:
Create an application that should all you to:  
- Type in a query and display a list of books matching that query.
- Each item in the list should include the book's author, title, and publishing company, as well as a picture of the book.
- From each list item, you should also be able to navigate to more information about the book, but this information does not necessarily need to appear on a page within your application. In other words, this could link out to an external site with more information about that particular book.

## Process:
- Created a Ruby on Rails web-application
- Configured the Google Books API for consumption
- Created API requests using HTTParty gem
- Consumed JSON responses from the API
- Mapped response to application-specific data by creating Book objects
- Added appropriate structure/styling for usability of the application (HTML/CSS/Bootstrap)
- Added appropriate unit tests for the controller, API wrapper, and class object created

## Set Up

        $ bundle install
        $ rails server

go to http://localhost:3000/ in the browser.

To run tests:

        $ rails test

## Deployment
The application is deployed on Heroku at: http://mybookworm.herokuapp.com/

To Deploy to heroku, take the following steps:
  1. Make a Heroku account and download Heroku command line tools at https://devcenter.heroku.com/articles/heroku-command-line.  
  2. Sign into Heroku from terminal  

        $ heroku login
        Enter your Heroku credentials.
        Email:  YOUR-EMAIL-HERE@SOMEWHERE.NET
        Password (Typing will be hidden):  
        Authentication successful.

  3. Navigate to app directory
  4. Choose an app name and create heroku app in terminal  

        ~ $ cd path/to/my_rails_app
        ~/path/to/my_rails_app $ heroku create my-new-app

  5. Use git push to push current state of master branch to Heroku.  

        ~/path/to/my_rails_app $ git push heroku master
        
  6. Open page in browser by going to link `http://my-new-app.herokuapp.com/` or `heroku open` command.


## Future Add-ons:
- Add feature to allow for navigation to book information on a page within the application -- will need to update consumption of JSON responses to map responses to book description, publisher date, page count etc.
