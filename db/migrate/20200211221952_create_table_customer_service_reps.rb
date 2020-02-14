class CreateTableCustomerServiceReps < ActiveRecord::Migration[5.0]
  def change
    create_table (:customer_service_reps) do |t|
      t.string :name
    end
  end
end
