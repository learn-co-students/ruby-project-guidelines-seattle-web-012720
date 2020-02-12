10.times do 
    ServiceRep.create(name: Faker::Name.name)
end

10.times do 
    CustomerServiceRep.create(name: Faker::Name.name)
end

order_status = ["received", "confirming validity", "confirming insurance", "ready for driver", "assigned to driver", "complete"]

10.times do 
    O2order.create(customer_service_rep: CustomerServiceRep.all.sample, service_rep: ServiceRep.all.sample, status: order_status.sample)
end