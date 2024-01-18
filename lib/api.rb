require 'nokogiri'
require 'open-uri'
require 'pry'
require 'json'
require_relative 'team.rb'

WEB_URL = 'https://www.scrapethissite.com/pages/forms/'

class API
  def self.scrape_hockey_teams(doc)
    hockey_team = doc.css('tbody tr')

    hockey_team.each do |row|
      team = row.css('td')[1].text.strip

      Team.new(name, year)
    end
  end

  def self.find_team_by_year(year)
    puts 'Scraping Hockey Teams......'
    unparsed_page = URI.open(WEB_URL)
    doc = Nokogiri::HTML(unparsed_page)

    teams = scrape_hockey_teams(doc)
    
    if teams.empty?
      puts "No teams found for year #{year}."
    else
      teams.each do |team| (doc)
      puts "Team: #{team} for the year #{year}"
      end
    end
  end
end