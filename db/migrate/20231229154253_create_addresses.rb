class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :calle, null: false
      t.integer :numero, null: false
      t.text :ciudad, null: false
      t.bigint :person_dni, null: false
      t.foreign_key :people, column: :person_dni, primary_key: :dni, on_delete: :cascade

      t.timestamps
    end
  end
end
