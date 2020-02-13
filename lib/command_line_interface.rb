class CommandLineInterface
  def start
    menu
    input
  end

  def greet
 

    puts 
    puts "\n"
    puts "Welcome to MattCare, your best tracking option for medicinal oxygen delivery!"
  end

  def menu
    puts "\n"
    puts "______________________________________"
    puts "1 - check current orders"
    puts "2 - create a new order"
    puts "3 - update the status of an order"
    puts "4 - assign a new driver to an order"
    puts "5 - delete an order"
    puts "6 - quit the program"
    puts "______________________________________"
  end

  #   def all
  #     print
  #   end
  response = nil

  def input
    response = gets.chomp
    if response == "1"
      fetch_all_orders
      start
    elsif response == "2"
      create_new_order
    elsif response == "3"
      update_status
    elsif response == "4"
      update_driver
    elsif response == "5"
      delete_order
    elsif response == "6"
      puts "bye!"
      sleep 1
    else
      print response
      print " isnt an option"
      print "\n"
      start
    end
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
    print "Here are all of the current orders in the system: \n"
    O2order.all.each do |x|
      location = x.location
      csr = x.customer_service_rep_id
      print "* order "
      print x.id
      print ". \n"
      print get_name_csr(csr)
      print " has an order with a status of: "
      print x.status
      print " in zip code "
      print location
      print ". \n \n"
    end
  end

  #   tc_zips = [98531, 98530, 98556, 98576, 98579, 98501, 98503, 98502, 98505, 98589, 98504, 98507, 98506, 98509, 98508, 98512, 98599, 98516, 98597, 98513]

  def check_zip
    zip = gets.chomp.to_i
    # binding.pry
    tc_zips = [98531, 98530, 98556, 98576, 98579, 98501, 98503, 98502, 98505, 98589, 98504, 98507, 98506, 98509, 98508, 98512, 98599, 98516, 98597, 98513]
    # numzip = zip.to_i
    # binding.pry
    if tc_zips.include? zip
      print "Great, that patient is in our area, you can proceed with the new order\n\n"
      @zip = zip
    else
      print "Looks like area code "
      print zip
      print " isnt in our area\n"
      print "Please call the local MattCare office in "
      print zip
      print " and fax them this order.\n"
      start
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
    @assigned_csr_id = assigned_csr_id
    print get_name_csr(assigned_csr_id)
    print " is creating this order.\n\n"
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
    @assigned_sr_id = assigned_sr_id
    print get_name_sr(assigned_sr_id)
    print " will be delivering/setting up this order.\n\n"
  end

  def order_type
    order_types = ["24-hour", "nocturnal", "nebulizer"]
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
    index = (selection - 1)
    @order_type = order_types[index]
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
    end
    print "Is " + get_name_sr(@assigned_sr_id) + " delivering this order?"
    yn = gets.chomp
    if yn == "Y"
      print "Service Rep confirmed!\n\n"
    elsif yn == "N"
      assign_sr
    end
    print "Is this an order for " + @order_type + "?"
    yn = gets.chomp
    if yn == "Y"
      print "Setup type confirmed!\n\n"
    elsif yn == "N"
      order_type
    end
    # binding.pry
    print "For special instructions, you said:" + @spuckts
    yn = gets.chomp
    if yn == "Y"
      print "instructions confirmed!\n\n"
    elsif yn == "N"
      get_notes
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
    assign_csr
    assign_sr
    order_type
    get_notes
    confirm
    create_order
    start
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
    start
  end

  def list_drivers
    # if response = 1
    print "Here are all of the current orders in the system: \n"
    O2order.all.each do |x|
      location = x.location
      sr = x.service_rep_id
      print "* order "
      print x.id
      print ". \n"
      print "This patient is located in zip code "
      print location
      print ". The driver currently assigned is "
      print get_name_sr(sr)
      print ". \n \n"
    end
  end

  def update_driver
    list_drivers
    print "\n"
    print "Please enter the number of the order for which you wish to change the assigned driver:\n"
    toupdate = gets.chomp.to_i
    assign_sr
    updateme = O2order.find_by(id: toupdate)
    updateme.service_rep_id = @assigned_sr_id
    updateme.save
    print "the driver of order "
    print toupdate
    print " has been updated to "
    print @assigned_sr_id
    start
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
end
