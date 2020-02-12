class AddColumnToO2orders < ActiveRecord::Migration[5.0]
  def change
    add_column(:o2orders, :status, :string, default: "received")
    add_column(:o2orders, :setup_type, :string)
    add_column(:o2orders, :special_instructions, :string, default: nil)
  end
end
