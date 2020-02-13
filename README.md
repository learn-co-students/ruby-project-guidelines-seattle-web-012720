Sliceline - a CRUD demo
========================

A simple CLI program to generate an order for pizza. This repository contains a command-line-interface program that allows the user to create an order, update the order, find their order, and delete their order. It utilizes Ruby and SQLite3 (thrugh ActiveRecord) to create a database with various associations, provides the methods to access the database, and creates an user experience through CLI.

---

## Installation

Fork and clone the repository. You will need to have Ruby installed on your device.

- Open the directory in your terminal
- enter: bundle install to install the necessary gems
- enter: rake db:migrate to create the database
- enter: rake db:seed to add data to the databas (optional)

---

## Run the Program

### start the program

- enter: ruby bin/run.rb

![start program](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/Program_start_up.png)

### choose existing order

- enter: y or Y

![existing order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_chooses_existing_order_asks_for_name.png)

### enter name to locate order

- enter: NAME

![locate order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/Greets_user_looks_up_and_displays_order_asks_to_modify.png)

### select modify order

- enter: y or Y

![modify order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_selects_modify_order.png)


### select change order

- enter: change (not case sensitive)

![change order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_selects_chagne_order.png)

### select add pizza to order

- enter: add (not case sensitive)

![add pizza to order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_selects_add_to_order.png)

### enter the number of pizzas to add

- enter: NUMBER

![adds NUMBER pizzas to order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_enters_the_number_of_pizzas_to_add_displays_current_order_prompts_other_changes.png)

### select remove pizza from order

- enter: remove (not case sensitive)

![removes pizzas from order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_selects_remove_pizza.png)

### enter the number of pizzas to remove

- enter: NUMBER

![removes NUMBER pizzas from order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_enters_the_number_of_pizzas_to_remove.png)

### user removes all pizzas from their order

- enter: NUMBER

![removes all pizzas from order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_empties_their_order.png)

### select cancel pizza from order

- enter: cancel (not case sensitive)

![cancel order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_selects_cancel_order.png)

### confirm order cancellation

- enter: y or Y

![confirm cancellation](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_confirms_cancel_order_command.png)

### abort order cancellation

- enter: n or N

![abort cancellation](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_aborts_order_cancellation.png)

### user mistakenly selects has order

- enter: y or Y then: NAME

![mistaken order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_mistakenly_selects_has_an_order.png)

### user mistakenly selects has order and no to create order

- enter: y or Y then: NAME then: n or N then: y or Y

![mistaken order and missed create order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_has_no_order_still_wants_help.png)

### user selects create order

- enter: y or Y

![cancel order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_selects_create_an_order.png)


### user enters the number of pizzas in the order, then enters the topping

- enter: NUMBER then: TOPPINGS

![toppings in order](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/User_enters_toppings_input_is_parsed_sorted_and_stored.png)


### error handling

- if wrong input is given, follow instructions

![error handling](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/Error_handling_for_input.png)

![error handling](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/Error_handling_for_input_2.png)

![error handling](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/Error_handling_for_input_3.png)

![error handling](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/Error_handling_for_user_input_4.png)

![error handling](https://github.com/lfriedrichs/ruby-project-guidelines-seattle-web-012720/blob/master/images/Error_handling_for_user_input.png)
