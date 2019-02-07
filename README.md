# COFFEE (Coffee Ordering & Finance Flexibility Enhancement Environment)

COFFEE (Coffee Ordering & Finance Flexibility Enhancement Environment) is an inventory-tracking app designed for coffee distributors. 
It is a web-app built with Ruby, Sinatra, and SQL, created as part of the individual Ruby Project of my Software Development course at CodeClan.
COFFEE allows the user to keep track of products and their producers.
COFFEE is optimised for google Chrome, and has some display issues in Safari. It is not tested on other browsers.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

To run coffee, you will require to have the following installed on your machine: Ruby, PostgreSQL, and Sinatra

```
Ruby
PostgreSQL
```
Install Sinatra and the PG gem to allow Ruby to access PostgreSQL
```
gem install sinatra
gem install pg
```
If you wish to run the tests, you will be required to install minitest
```
gem install minitest
```

### Installing

Once you have all the prerequesits installed:

Create and seed a database

```
createdb coffee
psql -d coffee -f db/coffee.sql
rb db/seeds.rb
```

Run the web-server:

```
ruby coffee.rb
```

Open the web-view by pointing your favourite browser to:

```
http://localhost:4567
```

You are now free to add/edit/remove entries to the database.

## Running the tests

From the root directory of the project, run the test files:
```
rb models/specs/[test_file_name.rb
```

## Built With

* [Ruby](https://www.ruby-lang.org)
* [PostgreSQL](https://www.postgresql.org)
* [Sinatra](http://sinatrarb.com)

