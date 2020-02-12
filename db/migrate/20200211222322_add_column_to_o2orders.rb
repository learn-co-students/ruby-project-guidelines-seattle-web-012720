class AddColumnToO2orders < ActiveRecord::Migration[5.0]
  def change
    add_column(:o2orders, :status, :string, default: "received")
  end
end
