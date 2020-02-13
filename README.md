
Mattcare - Frontend
Mattcare is an app for tracking the delivery status of medical oxygen equipment.

This is a link the the backend repository.

Motivation
I wanted to create an app that would assist durable medical equipment companies in facilitating the delivery of oxygen and resperatory therapy equipment to patients.

Screenshots

Technology Used
Ruby
SQL
ActiveRecord

Features:

Users can
View a database of current orders
View orders by status, or by assigned driver
View individual orders with details
Create orders
Updte order status, driver, or delivery instructions
Delete an order

Installation
Clone down this project repository by clicking the green "Clone or download" button above. Copy the SSH link, and open up your computer's Terminal. Inside, type "git clone <the link you've just copied>". This should open up the project: You'll see folders labeled "bin", "config", "db", "lib", etc.

Back in your terminal, type "bundle install".

Then, from the root directory, run "rake db:migrate" to create the database locally.

Lastly, run "rake db:seed". Now you're ready to go!

Starting the program
To start the program, type "ruby bin/run.rb". Follow on-screen instructions. 

Contributing
Contributions are welcome, submit a pull request!

Authors
Matt Milton - GitHub

License
This project is licensed under the [GNU GPL](https://www.gnu.org/licenses/gpl-3.0.en.html)