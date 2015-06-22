## Blocmarks: Allows users to bookmark URL via email, persue other users bookmarks and maintain a personal index of categorized bookmark. 
Made with my mentor at [Bolc] (http://bloc.io).

About Blocmarks: The Blocmarks app allows users to organize bookmarks by topic and make them public so that other users can find  them and add bookmarks to their own profile. As a user you can have password-secured accounts, login/logout , email a URL to Blocmarks and have it saved to Blocmarks database. You can also see the index of topics and their bookmarks.We can create, read, update and delete bookmarks . The app makes sure that as User , only you can delete and update your bookmarks. Can also like/unlike bookmarks created by other users. 

This README would normally document whatever steps are necessary to get the
application up and running.

Ruby Version : rails 4.1.0

To view the app:
  start Rails server : rails s 
  Visit 'https://localhost:3000/'
  
To check app's available routes : rake routes 

Database creation : The development and production environments have different databases. Update your gem file such that it has the following:
  group :production do 
    gem 'pg'
    gem 'rails_12factor'
  end 

  group :development do 
    gem 'sqlite3'
  end 
  
  group :development, :test do
   gem 'rspec-rails', '~> 3.0'
   gem 'factory_girl_rails', '~> 4.0'
  end
  
Configuring production : 
  To configure email functionality for this app , you need to addon 'Mailgun' on production. 
  Command for configuring : 
    heroku addons:create mailgun
    
Gems required for this app: 
 gem 'bootstrap-saas'
 gem 'devise'
 gem 'pundit'
 gem 'figaro'
 gem 'redcarpet'

 
