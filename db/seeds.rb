# 10.times do
#   ServiceRep.create(name: Faker::Name.name)
# end
sr_roster = ["Todd", "Matt", "Justin", "Zane", "Michael", "Kris", "Pat", "CJ"]
tc_zips = [98531, 98530, 98556, 98576, 98579, 98501, 98503, 98502, 98505, 98589, 98504, 98507, 98506, 98509, 98508, 98512, 98599, 98516, 98597, 98513]

sr_roster.each do |sr_name|
    ServiceRep.create(name: sr_name, location: tc_zips.sample)
end

csr_roster = ["Amanda", "Brittany", "Phoenix", "Trey", "Melissa", "Laken", "Jake"]
csr_roster.each do |csr_name|
    CustomerServiceRep.create(name: csr_name)
end

# 10.times do
#   CustomerServiceRep.create(name: Faker::Name.name)
# end

order_types = ["24-hour", "nocturnal", "nebulizer"]
order_status = ["received", "confirming validity", "confirming insurance", "ready for driver", "assigned to driver", "complete"]
sample_notes = ["gate code 45345", "none", "none", "none", "none", "none", "none", "none", "none", "none", "none", "pt hard of hearing, knock hard", "upstairs apartment", "call when you arrive"]

10.times do
  O2order.create(customer_service_rep: CustomerServiceRep.all.sample, service_rep: ServiceRep.all.sample, location: tc_zips.sample, status: order_status.sample, setup_type: order_types.sample, special_instructions: sample_notes.sample)
end
