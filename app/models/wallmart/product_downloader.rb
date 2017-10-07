module Wallmart
  class ProductDownloader
    require 'nokogiri'
    require 'open-uri'
    READ_TIMEOUT = 10

    def initialize url
      @page = open(url, read_timeout: READ_TIMEOUT)
    end

    def document
      Nokogiri::HTML(@page)
    end

  end
end