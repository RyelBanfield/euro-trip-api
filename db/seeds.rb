# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
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

require 'httparty'
countriesResponse = HTTParty.get('https://restcountries.eu/rest/v2/region/europe')
countriesJson = countriesResponse.parsed_response
countriesJson.each do |country|
  Country.create(
    name: country['name'],
    capital: country['capital'],
    population: country['population'],
    language: country['languages'][0]['name'],
    demonym: country['demonym'],
    currency: country['currencies'][0]['name'],
    flag: country['flag']
  )

  Image.create(
    url: country['flag'],
    country_id: Country.last.id
  )
end

