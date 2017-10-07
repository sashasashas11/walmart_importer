class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :author
      t.integer :review_id, unique: true
      t.float :rating
      t.text :message
      t.integer 'product_id'

      t.timestamps
    end
  end
end
