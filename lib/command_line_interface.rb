class CommandLineInterface
  def start
    menu
    input
  end

  def greet
    system("cls") || system("clear")
    puts "    TTTTTTTTTTTTTTTTTTTTTTT                                                       kkkkkkkk                                 OOOOOOOOO      222222222222222    
    T:::::::::::::::::::::T                                                       k::::::k                               OO:::::::::OO   2:::::::::::::::22  
    T:::::::::::::::::::::T                                                       k::::::k                             OO:::::::::::::OO 2::::::222222:::::2 
    T:::::TT:::::::TT:::::T                                                       k::::::k                            O:::::::OOO:::::::O2222222     2:::::2 
    TTTTTT  T:::::T  TTTTTTrrrrr   rrrrrrrrr   aaaaaaaaaaaaa      cccccccccccccccc k:::::k    kkkkkkk                 O::::::O   O::::::O            2:::::2 
            T:::::T        r::::rrr:::::::::r  a::::::::::::a   cc:::::::::::::::c k:::::k   k:::::k                  O:::::O     O:::::O            2:::::2 
            T:::::T        r:::::::::::::::::r aaaaaaaaa:::::a c:::::::::::::::::c k:::::k  k:::::k                   O:::::O     O:::::O         2222::::2  
            T:::::T        rr::::::rrrrr::::::r         a::::ac:::::::cccccc:::::c k:::::k k:::::k    --------------- O:::::O     O:::::O    22222::::::22   
            T:::::T         r:::::r     r:::::r  aaaaaaa:::::ac::::::c     ccccccc k::::::k:::::k     -:::::::::::::- O:::::O     O:::::O  22::::::::222     
            T:::::T         r:::::r     rrrrrrraa::::::::::::ac:::::c              k:::::::::::k      --------------- O:::::O     O:::::O 2:::::22222        
            T:::::T         r:::::r           a::::aaaa::::::ac:::::c              k:::::::::::k                      O:::::O     O:::::O2:::::2             
            T:::::T         r:::::r          a::::a    a:::::ac::::::c     ccccccc k::::::k:::::k                     O::::::O   O::::::O2:::::2             
          TT:::::::TT       r:::::r          a::::a    a:::::ac:::::::cccccc:::::ck::::::k k:::::k                    O:::::::OOO:::::::O2:::::2       222222
          T:::::::::T       r:::::r          a:::::aaaa::::::a c:::::::::::::::::ck::::::k  k:::::k                    OO:::::::::::::OO 2::::::2222222:::::2
          T:::::::::T       r:::::r           a::::::::::aa:::a cc:::::::::::::::ck::::::k   k:::::k                     OO:::::::::OO   2::::::::::::::::::2
          TTTTTTTTTTT       rrrrrrr            aaaaaaaaaa  aaaa   cccccccccccccccckkkkkkkk    kkkkkkk                      OOOOOOOOO     22222222222222222222
                                                                                                                                                             "
    puts "\n"
    puts "Welcome to Track-O2, your best tracking option for medicinal oxygen delivery!"
  end

  def menu
    puts "** Main Menu **\n"
    puts "______________________________________"
    puts "1 - order status"
    puts "2 - create a new order"
    puts "3 - update an order"
    puts "4 - delete an order"
    puts "5 - quit the program"
    puts "______________________________________"
  end

  def status_menu
    puts "\n** Order Status Menu **"
    puts "__________________________________________"
    puts "1 - View all orders"
    puts "2 - View current orders"
    puts "3 - list details for a single order"
    puts "4 - View orders wth a status of 'complete'"
    puts "5 - View orders by individual service rep"
    puts "6 - View all orders grouped by service rep"
    puts "7 - Return to main menu"
    puts "__________________________________________"
  end

  def update_menu
    puts "** Order Update Menu **\n"
    puts "______________________________________"
    puts "1 - Update order status"
    puts "2 - Assign a Service Rep"
    puts "3 - Add delivery instructions"
    puts "4 - return to main menu"
    puts "______________________________________"
  end

  def update_input
    response = gets.chomp
    if response == "1"
      system("cls") || system("clear")
      update_status
      start
    elsif response == "2"
      system("cls") || system("clear")
      list_drivers
      update_driver
      start
    elsif response == "3"
      system("cls") || system("clear")
      print "feature not built\n\n"
      start
      # elsif response == "4"
      #   complete_orders
      #   start
      # elsif response == "5"
      #   order_by_sr
      #   start
      # elsif response == "5"
      #   delete_order
    elsif response == "4"
      system("cls") || system("clear")
      start
    else
      print response
      print " isnt an option"
      print "\n"
      start
    end
  end

  def status_input
    response = gets.chomp
    if response == "1"
      system("cls") || system("clear")
      fetch_all_orders
      start
    elsif response == "2"
      system("cls") || system("clear")
      current_orders
      start
    elsif response == "3"
      system("cls") || system("clear")
      order_details
      start
    elsif response == "4"
      system("cls") || system("clear")
      complete_orders
      start
    elsif response == "5"
      system("cls") || system("clear")
      order_by_sr
      start
    elsif response == "6"
      system("cls") || system("clear")
      order_all_by_sr
      start
    elsif response == "7"
      system("cls") || system("clear")
      start
    else
      print response
      print " isnt an option"
      print "\n"
      start
    end
  end

  #   def all
  #     print
  #   end
  response = nil

  def input
    response = gets.chomp
    if response == "1"
      system("cls") || system("clear")
      read_order_status
      #   start
    elsif response == "2"
      system("cls") || system("clear")
      create_new_order
    elsif response == "3"
      system("cls") || system("clear")
      order_update
    elsif response == "4"
      system("cls") || system("clear")
      delete_order
    elsif response == "5"
      system("cls") || system("clear")
      puts "bye!"
      sleep 1
    elsif response == "test"
      system("cls") || system("clear")
      print "Mua hahahahahahaha I'm a mad scientist!"
      testing
    else
      print response
      print " is not an option, please try again."
      print "\n"
      start
    end
  end

  def read_order_status
    status_menu
    status_input
  end

  def order_update
    update_menu
    update_input
  end

  def get_name_csr(csr_id)
    CustomerServiceRep.all.find do |x|
      if x.id == csr_id
        return x.name
      end
    end
  end

  def get_name_sr(sr_id)
    ServiceRep.all.find do |x|
      if x.id == sr_id
        return x.name
      end
    end
  end

  def fetch_all_orders
    # if response = 1
    print "Here are all of the orders in the system: \n"
    O2order.all.each do |x|
      location = x.location
      csr = x.customer_service_rep_id
      print "* order "
      print x.id
      print ". -- Customer Service Rep: "
      print get_name_csr(csr)
      print ". Status: "
      print x.status
      print " Zip code: "
      print location
      print ". \n \n"
    end
  end

  #   tc_zips = [98531, 98530, 98556, 98576, 98579, 98501, 98503, 98502, 98505, 98589, 98504, 98507, 98506, 98509, 98508, 98512, 98599, 98516, 98597, 98513]

  def check_zip
    @zip = nil
    zip = gets.chomp.to_i
    # binding.pry
    tc_zips = [98531, 98530, 98556, 98576, 98579, 98501, 98503, 98502, 98505, 98589, 98504, 98507, 98506, 98509, 98508, 98512, 98599, 98516, 98597, 98513]
    # numzip = zip.to_i
    # binding.pry
    if tc_zips.include? zip
      print "Great, that patient is in our area, you can proceed with the new order\n\n"
      @zip = zip
    else
      if zip == 0 || zip.digits.count > 5
        print "That was not a valid zip code. please try again\n"
        check_zip
      else
        print "Looks like area code "
        print zip
        print " isnt in our area\n"
        print "Please call the local Track-O2 office in "
        print zip
        print " and fax them this order.\n"
      end
    end
  end

  def assign_csr
    print "please enter the number of the Customer Service Representative creating this order.\n"
    CustomerServiceRep.all.each do |x|
      print x.id
      print " - "
      print x.name
      print "\n"
    end
    assigned_csr_id = gets.chomp.to_i
    if assigned_csr_id > CustomerServiceRep.all.length
      print "Please try again. \n"
      assign_csr
    else
      if assigned_csr_id < 1
        print "Please try again. \n"
        assign_csr
      else
        @assigned_csr_id = assigned_csr_id
        print get_name_csr(assigned_csr_id)
        print " is creating this order.\n\n"
      end
    end
  end

  def assign_sr
    print "please enter the number of the Service Representative who will be delivering this order.\n"
    ServiceRep.all.each do |x|
      print x.id
      print " - "
      print x.name
      print "\n"
    end
    assigned_sr_id = gets.chomp.to_i
    if assigned_sr_id > ServiceRep.all.length
      print "Please try again. \n"
      assign_sr
    else
      if assigned_sr_id < 1
        print "Please try again. \n"
        assign_sr
      else
        @assigned_sr_id = assigned_sr_id
        print get_name_sr(assigned_sr_id)
        print " will be delivering/setting up this order.\n\n"
      end
    end
  end

  def order_type
    order_types = ["24-hour oxygen", "nocturnal oxygen", "nebulizer device"]
    counter = 0
    print "What type of equipment will be set up for this order?\n\n"
    order_types.each do |x|
      print counter + 1
      print ". "
      print order_types[counter]
      print "\n"
      counter += 1
    end
    selection = gets.chomp.to_i
    if selection > order_types.length
      print "Please try again. \n"
      order_type
    else
      if selection < 1
        print "Please try again. \n"
        order_type
      else
        index = (selection - 1)
        @order_type = order_types[index]
      end
    end
  end

  def get_notes
    @spuckts = "none"
    print "Any special instructions for the delivery driver Y/N?"
    spucktsyn = gets.chomp
    if spucktsyn == "Y"
      print "Please write special instructions out now:"
      @spuckts = gets.chomp
    elsif spucktsyn == "N"
      print "no special instructions will be added"
    else
      print spucktsyn
      print " isnt an option, please try again\n\n"
      get_notes
    end
  end

  def confirm
    print "Lets confirm your order details\n"
    print "Is " + get_name_csr(@assigned_csr_id) + " creating this order?"
    yn = gets.chomp
    if yn == "Y"
      print "Customer Service Rep confirmed!\n\n"
    elsif yn == "N"
      assign_csr
    else
      print "please try again"
      confirm
    end
    print "Is " + get_name_sr(@assigned_sr_id) + " delivering this order?"
    yn = gets.chomp
    if yn == "Y"
      print "Service Rep confirmed!\n\n"
    elsif yn == "N"
      assign_sr
    else
      print "please try again"
      confirm
    end
    print "Is this an order for " + @order_type + "?"
    yn = gets.chomp
    if yn == "Y"
      print "Setup type confirmed!\n\n"
    elsif yn == "N"
      order_type
    else
      print "please try again"
      confirm
    end
    # binding.pry
    print "For special instructions, you said:" + @spuckts
    yn = gets.chomp
    if yn == "Y"
      print "instructions confirmed!\n\n"
    elsif yn == "N"
      get_notes
    else
      print "please try again"
      confirm
    end
  end

  def create_order
    O2order.create(customer_service_rep_id: @assigned_csr_id, service_rep_id: @assigned_sr_id, location: @zip, setup_type: @order_type, special_instructions: @spuckts)
    print "Your order has been created!"
  end

  def create_new_order
    print "Lets make a new o2 order!\n"
    print "First thing, lets make sure this order is in our area \n"
    print "Enter the zip code on the order:\n"
    check_zip
    if @zip.is_a? Integer
      assign_csr
      assign_sr
      order_type
      get_notes
      confirm
      create_order
      start
    else
      start
    end
  end

  def update_status
    fetch_all_orders
    print "\n"
    print "Please enter the number of the order you wish to update:\n"
    toupdate = gets.chomp.to_i
    order_status = ["received", "confirming validity", "confirming insurance", "ready for driver", "assigned to driver", "complete"]
    counter = 0
    print "\nWhat status would you like to assign to this order?\n\n"
    order_status.each do |x|
      print counter + 1
      print ". "
      print order_status[counter]
      print "\n"
      counter += 1
    end
    newselection = gets.chomp.to_i
    newindex = (newselection - 1)
    newstatus = order_status[newindex]
    updateme = O2order.find_by(id: toupdate)
    updateme.status = newstatus
    updateme.save
    print "the status of order "
    print toupdate
    print " has been updated to "
    print newstatus
    # start
  end

  def list_drivers
    # if response = 1
    print "Here are all of the current orders in the system: \n"
    O2order.all.each do |x|
      location = x.location
      sr = x.service_rep_id
      print "* order "
      print x.id
      print ". "
      print "Zip code: "
      print location
      print ". Service Rep: "
      print get_name_sr(sr)
      print ". \n \n"
    end
  end

  def update_driver
    list_drivers
    print "\n"
    print "Please enter the number of the order for which you wish to change the assigned driver:\n"
    print "_____________________________________________________\n"
    print "If you wish to cancel this action, please type 'back'\n"
    print "_____________________________________________________\n"
    toupdate = gets.chomp

    if toupdate == "back"
      print "Returning to main menu."
    else
      toupdate = toupdate.to_i
      #   binding.pry
      assign_sr
      updateme = O2order.find_by(id: toupdate)
      updateme.service_rep_id = @assigned_sr_id
      updateme.save
      #   print "the driver of order "
      #   print toupdate
      #   print " has been updated to "
      #   print get_name_sr(@assigned_sr_id)
    end
    # start
  end

  def delete_order
    fetch_all_orders
    print "Please type the number for the order that you wish to delete"
    deleteid = gets.chomp.to_i
    deleteme = O2order.find_by(id: deleteid)
    print "Are you sure that you want to delete order "
    print deleteid
    print " ?"
    confirm = gets.chomp
    if confirm == "Y"
      deleteme.destroy
      print "This order has been deleted"
      start
    elsif confirm == "N"
      start
    else
      print "you must be really unsure about this, lets start over"
      start
    end
  end

  def current_orders
    currentorders = O2order.all.filter { |x| x.status != "complete" }
    sortedcurrentorders = currentorders.sort_by { |obj| obj.created_at }
    print "Here are all of the unfinished orders in the system: \n"
    sortedcurrentorders.each do |x|
      print "* order "
      print x.id
      print ". \n"
      print "This order was created "
      print x.created_at
      print ". \n \n"
    end
  end

  def complete_orders
    currentorders = O2order.all.filter { |x| x.status == "complete" }
    sortedcurrentorders = currentorders.sort_by { |obj| obj.created_at }
    print "Here are all of the completed orders in the system: \n"
    sortedcurrentorders.each do |x|
      print "* order "
      print x.id
      print ". \n"
      print "This order was created "
      print x.created_at
      print ". \n \n"
    end
  end

  def order_by_sr
    print "Please select a driver by their number.\n"
    ServiceRep.all.each do |x|
      print x.id
      print " - "
      print x.name
      print "\n"
    end
    checked_sr_id = gets.chomp.to_i
    if checked_sr_id > ServiceRep.all.length
      print "Please try again. \n"
      order_by_sr
    else
      if checked_sr_id < 1
        print "Please try again. \n"
        order_by_sr
      else
        driversorders = O2order.all.filter { |x| x.service_rep_id == checked_sr_id }
        print "These are the current orders for "
        print get_name_sr(checked_sr_id)
        print ". \n"
        driversorders.each do |x|
          location = x.location
          csr = x.customer_service_rep_id
          print "* order "
          print x.id
          print ". \n"
          print "This order was created by "
          print get_name_csr(csr)
          print ", its status is currently: "
          print x.status
          print ". \n \n"
        end
      end
    end
  end

  def order_details
    print "Please enter the number of the order you would like to display:\n"
    disporderid = gets.chomp.to_i
    if disporderid <= 0
      print "Please try again.\n\n"
      order_details
    else
      if disporderid > O2order.all.length
        print "Please try again.\n\n"
        order_details
      else
        array = []
        O2order.all.each do |x|
          array << x.id
        end
        if array.exclude? disporderid
          print "That order does not exist. Please try again.\n\n"
          order_details
        else
          disporder = O2order.find_by(id: disporderid)
          print "______________________________________\n"
          print "        Status for order: "
          print disporderid
          print "\n______________________________________\n\n"
          print "Order "
          print disporderid
          print " is a "
          print disporder.setup_type
          print " setup. It is located in area "
          print disporder.location
          print ".\n\n"
          print "This order was created by: "
          print get_name_csr(disporder.customer_service_rep_id)
          print ".\n\n"
          print "Order created: "
          print disporder.created_at
          print "\nLast update: "
          print disporder.updated_at
          print "\n\nCurrent status for this order is: "
          print disporder.status
          print "\n\nThis order has been assigned to "
          print get_name_sr(disporder.service_rep_id)
          print ". \n\n"
          if disporder.special_instructions == "none" || nil
            print "This order has no special instructions\n\n"
          else
            print "**Special instructions**\n"
            print disporder.special_instructions
          end
        end
      end
    end
  end

  def order_all_by_sr
    ServiceRep.all.each do |rep|
      id = rep.id
      orders = O2order.all.filter { |x| x.service_rep_id == id }
      print "\n\n"
      print rep.name
      print " - current orders: "
      print orders.size
      print "\n____________________________\n"
      orders.each do |z|
        print "* Order "
        print z.id
        print " located in "
        print z.location
        print ". \n"
      end
    end
    nosr = O2order.all.filter { |x| x.service_rep_id == nil }
    print "\n\n No SR assigned: "
    print nosr.size
    print "\n____________________________\n"
    nosr.each do |z|
      print "* Order "
      print z.id
      print " located in "
      print z.location
      print ". \n"
    end
  end
end
