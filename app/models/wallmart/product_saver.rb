module Wallmart
  class ProductSaver
    def initialize product_id
      @product = Product.find_or_create_by(product_id: product_id)
    end

    def save product
      @product.update_attributes(product)
      @product
    end
  end
end