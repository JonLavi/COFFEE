COFFEE (Coffee Ordering & Finance Flexibility Enhancement Environment) is an inventory-tracking app designed for coffee distributors. 
It is a web-app built with Ruby, Sinatra, and SQL, created as part of the individual Ruby Project of my Software Development course at CodeClan.
COFFEE allows the user to keep track of products and their producers.
COFFEE is optimised for google Chrome, and has some display issues in Safari. It is not tested on other browsers.

To run COFFEE:

1: Create and seed a database:

createdb coffee

psql -d coffee -f db/coffee.sql

ruby db/seeds.sql

2: Run the web-server:

ruby coffee.rb

3: Open the web-view by pointing your favourite browser:

http://localhost:4567
