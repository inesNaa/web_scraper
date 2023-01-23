class RealEstatesSpider < Kimurai::Base
  @name = 'real_estates_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, url:, data: {})
    response.xpath("//div[@class='sc-hBcjXN koUqOK']").each do |real_estate|
      item = {}

      item[:title] = real_estate.css('p.sc-eXNvrr llXeRu')&.text&.squish
      # item[:price]      = real_estate.css('span.listing-row__price')&.text&.squish&.delete('^0-9').to_i
      # item[:area] = real_estate.css('div.listing-row__stocktype')&.text&.squish
      # item[:type]      = real_estate.css('span.listing-row__mileage')&.text&.squish&.delete('^0-9').to_i
      # item[:poster_url] = real_estate.css('ul.listing-row__meta li')[0]&.text&.squish.gsub('Ext. Color: ', '')
      # item[:interior_color] = real_estate.css('ul.listing-row__meta li')[1]&.text&.squish.gsub('Int. Color: ', '')
      # item[:transmission] = real_estate.css('ul.listing-row__meta li')[2]&.text&.squish.gsub('Transmission: ', '')
      # item[:drivetrain]   = real_estate.css('ul.listing-row__meta li')[3]&.text&.squish.gsub('Drivetrain: ', '')

      RealEstate.where(item).first_or_create
    end
  end
end
