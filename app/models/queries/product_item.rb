module Queries
  class ProductItem
    def initialize product
      @product = product
    end

    def filter_reviews_by_keyword keyword
      @product.reviews.where('message LIKE concat('%', ?, '%')', keyword)
    end
  end
end