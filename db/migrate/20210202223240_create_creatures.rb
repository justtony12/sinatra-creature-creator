class CreateCreatures < ActiveRecord::Migration[5.2]
  def change
    create_table :creations do |t|
      t.string :name
      t.text :description
      t.decimal :height
      t.decimal :weight
      t.string :temperament
      t.string :species

      t.integer :user_id
    end
  end
end
