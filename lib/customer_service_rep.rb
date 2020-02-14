class CustomerServiceRep < ActiveRecord::Base
    has_many :o2orders
    has_many :service_reps, through: :o2orders
  end