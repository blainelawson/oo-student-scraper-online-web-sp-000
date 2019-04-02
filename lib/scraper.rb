require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    # binding.pry
    doc.css(".roster-cards-container").each do |student_cards|
      # binding.pry
      student_cards.each do |student_card|
        binding.pry
      end
    end
  end

  def self.scrape_profile_page(profile_url)
  end

end
