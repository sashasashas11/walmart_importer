module Api
  class ProductsController
    before_filter :init_product, only: [:show, :filter_by_keyword]

    def index
      products = Product.all.map(&:to_json)
      json_success products
    end

    def show
      json_success @product.to_json_full
    end

    def import
      Wallmart::ProductImporter.new(params[:url]).delay.import
      json_success {}
    end

    def filter_by_keyword
      product_item = Queries::ProductItem.new(@product)
      json_success product_item.filter_reviews_by_keyword(params[:keyword]).map(&:to_json)
    end

    private

    def init_product
      @product = Product.find(params[:id])
    end
  end
end