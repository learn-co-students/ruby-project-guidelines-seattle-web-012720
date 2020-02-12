class CreateTableServiceReps < ActiveRecord::Migration[5.0]
  def change
    create_table (:service_reps) do |t|
      t.string :name
      t.integer :location
    end
  end
end
