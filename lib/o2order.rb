class O2order < ActiveRecord::Base
  belongs_to :customer_service_rep
  belongs_to :service_rep

  #   def return_current
  #     if response = "1"
  #         not_done=[]
  #       O2order.all.find_all do |x|
  #         if x.status != "complete"
  #             not_done<< x

  #         end
  #       end
  #     end
  #   end
  # end
end
