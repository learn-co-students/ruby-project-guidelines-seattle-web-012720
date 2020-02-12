class O2order < ActiveRecord::Base
  belongs_to :customer_service_rep
  belongs_to :service_rep
end
