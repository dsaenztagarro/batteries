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

DeviceCategory.create!(name: 'Keyboard')

AA = BatterySize.create!(name: 'AA')
AAA = BatterySize.create!(name: 'AAA')

amazonBasics_AA = BatteryModel.create!(
  battery_size: AA,
  capacity: '2000',
  name: 'AmazonBasics',
  rechargeable: true
)

amazonBasics_AAA = BatteryModel.create!(
  battery_size: AAA,
  capacity: '800',
  name: 'AmazonBasic',
  rechargeable: true
)

BatteryPackModel.create!(
  battery_model: amazonBasics_AA,
  precharged: true,
  size: 16
)

BatteryPackModel.create!(
  battery_model: amazonBasics_AAA,
  precharged: true,
  size: 12
)
