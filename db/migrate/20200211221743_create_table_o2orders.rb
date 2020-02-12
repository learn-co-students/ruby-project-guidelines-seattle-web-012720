class CreateTableO2orders < ActiveRecord::Migration[5.0]
  def change
    create_table (:o2orders) do |t|
      t.integer :customer_service_rep_id
      t.integer :service_rep_id
      t.integer :location
    end
  end
end
