class Product < ApplicationRecord
  has_many :reviews

  def to_json
    {
       id: id,
       title: title,
       price: price,
    }
  end

  def to_json_full
    to_json.merge({
      reviews: reviews.map(&:to_json)
    })
  end
end
