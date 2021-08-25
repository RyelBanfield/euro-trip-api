require 'faker'
require 'httparty'
require 'urlify'
accessKey = ENV['UNSPLASH_ACCESS_KEY']
Images = []

25.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name 
  User.create(
    {
      sub: Faker::Internet.uuid,
      email: first_name + '.' + last_name + '@euro-trip.com',
      name: first_name + ' ' + last_name,
      given_name: first_name,
      family_name: last_name,
      picture: "https://avatars.dicebear.com/api/initials/#{first_name[0..1]}.svg"
    }
  )
end

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

100.times do
  Favourite.create(
    user_id: Faker::Number.within(range: 1..25),
    country_id: Faker::Number.within(range: 1..53)
  )
end