module Wallmart

  class ProductImporter

    def initialize url
      @url = url
      @product_id = get_product_id(url)
    end

    def import
      product = import_product
      import_reviews(product)
    rescue Exception => e
      reise e.message
    end

    def import_product
      document = ProductDownloader.new(@url).document
      product = ProductParser.new(document).parse
      ProductSaver.new(@product_id).save(product)
    end

    def import_reviews product
      reviews = ReviewsDownloader.new(@product_id).load
      ReviewsSaver.new(product.id).save(reviews)
    end

    def get_product_id url
      url.split('/').last.to_i
    end
  end
end