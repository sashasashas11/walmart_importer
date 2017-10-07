module Wallmart
  class ProductParser
    TITLE_SELECTOR = '.prod-ProductTitle'
    PRICE_SELECTOR = '.prod-PriceHero .hide-content .Price-characteristic'

    def initialize page
      @page = page
    end

    def parse
      title = @page.css(TITLE_SELECTOR).text
      price = @page.css(PRICE_SELECTOR).first['content'].to_f
      { title: title, price: price }
    end

  end
end