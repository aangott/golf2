# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

players = Player.create [{first_name: 'Rick',
                          last_name: 'Lemanski',
                          flight: '1',
                          number: 'A'},
                         
                         {first_name: 'Dave',
                          last_name: 'Nako',
                          flight: '1',
                          number: 'D'},

                         {first_name: 'Frank',
                          last_name: 'Valenti',
                          flight: '2',
                          number: '11'},
                         
                         {first_name: 'Gary',
                          last_name: 'Landless', 
                          suffix: 'Sr.',
                          flight: '2',
                          number: '1'}]
     