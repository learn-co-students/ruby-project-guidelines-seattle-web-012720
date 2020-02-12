class CommandLineInterface
  def greet
    puts "Welcome to MattCare, the best resource for medicinal oxygen delivery information in the world!"
  end

  def check
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
    puts response + " is what you typed"
  end

  def if1
    if response = 1
      puts O2order.all.location
    end
  end

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
