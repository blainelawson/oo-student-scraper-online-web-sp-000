require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    # binding.pry
    doc.css(".student-card").each do |student_cards|
      binding.pry
    end
  end

  def self.scrape_profile_page(profile_url)
  end

end
