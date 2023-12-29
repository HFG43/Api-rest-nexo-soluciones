class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people, :id => false do |t|
      t.bigserial :dni, primary_key: true
      t.string :nombre, null: false
      t.string :apellido, null: false
      t.integer :edad, null: false
      t.string :foto, null: false

      t.timestamps
    end
  end
end