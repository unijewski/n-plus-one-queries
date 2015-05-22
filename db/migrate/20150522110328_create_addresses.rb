class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street

      t.timestamps null: false
    end
  end
end
