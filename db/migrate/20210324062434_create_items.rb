class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.string     :name,               null: false
      t.integer    :price,              null: false
      t.integer    :category_id,        null: false
      t.references :user,               null: false, foreign_key: true
      t.text       :descuription,       null: false
      t.integer    :condition_id,       null: false
      t.integer    :postage_type_id,    null: false
      t.integer    :preparation_day_id, null: false
      t.integer    :place_shipment_id,  null: false


      t.timestamps
    end
  end
end
