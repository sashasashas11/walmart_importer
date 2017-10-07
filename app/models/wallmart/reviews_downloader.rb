module Wallmart
  require 'open-uri'
  require 'json'
  BASE_URL = 'https://www.walmart.com/terra-firma/item/'
  REVIEW_LIMIT = 100

  class ReviewsDownloader
    def initialize product_id
      @product_id = product_id
    end

    def load
      reviews = []
      page_number = 1
      new_reviews = []
      begin
        new_reviews = parse_page(page_number)
        reviews += new_reviews
        page_number+=1
      end while new_reviews.length > 0
      reviews
    end

    def parse_page page_number
      JSON.parse(open(url(page_number)).read)['payload']['customerReviews']
    end

    def url page
      "#{BASE_URL}#{@product_id}/reviews?showProduct=false&sort=relevancy&filters=&page=#{page}&limit=#{REVIEW_LIMIT}"
    end
  end
end