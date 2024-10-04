class CreateShippingFroms < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_froms do |t|

      t.timestamps
    end
  end
end
