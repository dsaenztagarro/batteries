# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
  email:                 'development@myfamilyweb.es',
  password:              '12345678',
  password_confirmation: '12345678'
)

BatterPackType.create!(
  name: 'AmazonBasics AA (Pack 16)',
  description: 'AA NiMH Precharged Rechargeable Batteries (16 Pack, 2000 mAh)',
  size: 16)
