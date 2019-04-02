require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    student_hash_array = []
    student_hash = {}

    html = open(index_url)
    doc = Nokogiri::HTML(html)

    doc.css(".student-card").each do |student_card|
      student_hash = {
                          name: student_card.css("h4").text,
                      location: student_card.css("p").text,
                   profile_url: student_card.css("a").attr("href").value
                  }

      student_hash_array << student_hash
    end
    student_hash_array
  end

  def self.scrape_profile_page(profile_url)
    attributes_hash = {}

    html = open(profile_url)
    doc = Nokogiri::HTML(html)
# binding.pry
    doc.css(".social-icon-container a").each do |social|
      # binding.pry
      if social.attr("href").include?("twitter")
        attributes_hash[:twitter] = social.attr("href")
      elsif social.attr("href").include?("linkedin")
        attributes_hash[:linkedin] = social.attr("href")
      elsif social.attr("href").include?("github")
        attributes_hash[:github] = social.attr("href")
      end
    end
binding.pry

  attributes_hash[:bio] = doc.css(".bio-content p").text
  end # self.scrape_profile_page

end
