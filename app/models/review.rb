class Review < ApplicationRecord
  belongs_to :product

  def to_json
    {
      id: id,
      author: author,
      message: message,
      rating: rating,
      product_id: product_id,
    }
  end
end
