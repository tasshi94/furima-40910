class CreateDestinations < ActiveRecord::Migration[7.0]
  def change
    create_table :destinations do |t|
      t.string     :post_code,        null: false
      t.integer    :shipping_from_id, null: false
      t.string     :city,             null: false
      t.string     :street,           null: false
      t.string     :building_name
      t.string     :phone_number,     null: false
      t.references :order,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
