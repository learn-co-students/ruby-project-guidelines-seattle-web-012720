class ServiceRep < ActiveRecord::Base
    has_many :o2orders
    has_many :customer_service_reps, through: :o2orders
  end