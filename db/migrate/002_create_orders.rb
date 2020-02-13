class CreateOrders < ActiveRecord::Migration[5.1]
    def change
        create_table :orders do |t| #we get a block variable here for the table
          #primary key of :id is created for us!
          # defining columns is as simple as t.[datatype] :column
          t.integer :user_id
          t.integer :pizza_id
          t.integer :num_pizzas
          t.timestamps
        end
      end
end