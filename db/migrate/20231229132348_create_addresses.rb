class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :calle, null: false
      t.integer :numero, null: false
      t.text :ciudad, null: false

      t.timestamps
    end
  end
end
