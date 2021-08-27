require 'faker'
require 'httparty'
require 'urlify'
accessKey = ENV['UNSPLASH_ACCESS_KEY']
Images = []

countriesResponse = HTTParty.get('https://restcountries.eu/rest/v2/region/europe')
countriesJSON = countriesResponse.parsed_response
countriesJSON.drop(4).each do |country|
  if (country['name'] != 'Moldova (Republic of)') && (country['name'] != 'Republic of Kosovo') && (country['name'] != 'Ukraine')
    Country.create(
      name: country['name'],
      capital: country['capital'],
      population: country['population'],
      language: country['languages'][0]['name'],
      demonym: country['demonym'],
      currency: country['currencies'][0]['name'],
      flag: country['flag']
    )

    Images.concat(HTTParty.get("https://api.unsplash.com/search/photos/?client_id=#{accessKey}&query=#{URLify.urlify(country['capital'], '-')}&per_page=5&orientation=landscape").parsed_response['results'])
  
    Images.each do |image|
      Image.create(
        country_id: Country.last.id,
        url: image['urls']['regular']
      )
    end
    Images.clear
  end
end
