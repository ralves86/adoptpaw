class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :fee
      t.string :breed
      t.string :location
      t.text :description
      t.boolean :medical
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
