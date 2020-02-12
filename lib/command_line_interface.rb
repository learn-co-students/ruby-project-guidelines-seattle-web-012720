class CommandLineInterface
  def greet
    puts "Welcome to MattCare, the best resource for medicinal oxygen delivery information in the world!"
  end

  def check
    puts "\n"
    puts "1 - check current orders"
    puts "2 - create a new order"
    puts "3 - update the status of an order"
    puts "4 - assign a driver to an order"
    puts "5 - delete an order"
  end

  #   def all
  #     print
  #   end
  response = nil

  def input
    response = gets.chomp
  end

  def get_name_csr(csr_id)
    CustomerServiceRep.all.find do |x|
      if x.id == csr_id
        return x.name
      end
    end
  end

  def if1
    if response = 1
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
  end

  #   {|x| puts x.service_rep_id + " has an order for " + x.setup_type + " in area code " + x.location}

  # def return_current
  #   if response = "1"
  #       not_done=[]
  #     O2order.all.find_all do |x|
  #       if x.status != "complete"
  #           not_done<< x

  #       end
  #     end
  #   end
  # end
end
