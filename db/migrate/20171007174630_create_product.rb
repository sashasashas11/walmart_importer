class CreateProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :product_id, unique: true
      t.string :title
      t.float :price
      t.string :type

      t.timestamps
    end
  end
end
