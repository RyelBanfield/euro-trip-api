require 'httparty'
require 'urlify'
accessKey = ENV['UNSPLASH_ACCESS_KEY']
Images = []

User.create([
  {
    sub: "1",
    email: "ryelbanfield@gmail.com",
    name: "Ryel Banfield",
    given_name: "Ryel",
    family_name: "Banfield",
    picture: "https://picture.jpg"
  },
  {
    sub: "2",
    email: "johndoe@gmail.com",
    name: "John Doe",
    given_name: "John",
    family_name: "Doe",
    picture: "https://picture.jpg"
  }
])

countriesResponse = HTTParty.get('https://restcountries.eu/rest/v2/region/europe')
countriesJSON = countriesResponse.parsed_response
countriesJSON.each do |country|
  Country.create(
    name: country['name'],
    capital: country['capital'],
    population: country['population'],
    language: country['languages'][0]['name'],
    demonym: country['demonym'],
    currency: country['currencies'][0]['name'],
    flag: country['flag']
  )

  Images.concat(HTTParty.get("https://api.unsplash.com/search/photos/?client_id=#{accessKey}&query=#{URLify.urlify(country['capital'], '-')}&per_page=5&orientation=landscape").parsed_response['results'] ? HTTParty.get("https://api.unsplash.com/search/photos/?client_id=#{accessKey}&query=#{URLify.urlify(country['capital'], '-')}&per_page=5&orientation=landscape").parsed_response['results'] : [])


  Images.each do |image|
    Image.create(
      country_id: Country.last.id,
      url: image['urls']['regular']
    )
  end
  Images.clear
end
