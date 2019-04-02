require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_hash = {}

    html = open(index_url)
    doc = Nokogiri::HTML(html)
    # binding.pry
    doc.css(".student-card").each do |student_card|
      binding.pry
      student_cards.css("a").attr("href").value # student url
      student_cards.css("p").text #location
      student_cards.css("h4").text #name
    end
  end

  def self.scrape_profile_page(profile_url)
  end

end
