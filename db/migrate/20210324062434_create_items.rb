class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.string     :name,               null: false
      t.integer    :price,              null: false
      t.integer    :category_id,        null: false
      t.references :user,               null: false, foreign_key: true
      t.text       :descuription,       null: false
      t.integer    :condition_id,       null: false
      t.integer    :postagetype_id,    null: false
      t.integer    :preparationday_id, null: false
      t.integer    :placeshipment_id,  null: false


      t.timestamps
    end
  end
end
