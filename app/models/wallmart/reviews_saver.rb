module Wallmart
  class ReviewsSaver
    def initialize product_id
      @product_id = product_id
    end

    def save reviews
      reviews.each { |review|
        review_hash = {
          review_id: review['reviewId'],
          author: review['userNickname'],
          rating: review['rating'],
          message: review['reviewText'],
          product_id: @product_id,
        }
        Review.create_with(review_hash).find_or_create_by(review_id: review['reviewId'])
      }
    end
  end
end