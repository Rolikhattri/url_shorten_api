# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Url.create({:given_link => "www.google.com", :slug => "1", :short_link => "http://ro.li/1", :min_link => "http://google.com"})
Url.create({:given_link => "www.facebook.com", :slug => "2", :short_link => "http://ro.li/2", :min_link => "http://facebook.com"})
Url.create({:given_link => "www.amazon.com", :slug => "3", :short_link => "http://ro.li/3", :min_link => "http://amazon.com"})