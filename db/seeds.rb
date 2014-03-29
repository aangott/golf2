# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

players = [{first_name: 'Rick',
            last_name: 'Lemanski',
            flight: '1',
            number: '1'},
                     
           {first_name: 'Dave',
            last_name: 'Nako',
            flight: '1',
            number: '2'},

           {first_name: 'John',
            last_name: 'Brown',
            flight: '1',
            number: '3'},

           {first_name: 'Dave',
            last_name: 'Duncan',
            flight: '1',
            number: '4'},

           {first_name: 'Steve',
            last_name: 'Duggan',
            flight: '1',
            number: '5'},

           {first_name: 'Tom',
            last_name: 'Luke',
            flight: '1',
            number: '6'},

           {first_name: 'Paul',
            last_name: 'Fisher',
            flight: '1',
            number: '7'},

           {first_name: 'Bob',
            last_name: 'Kohn',
            flight: '1',
            number: '8'},

           {first_name: 'Tom',
            last_name: 'MacMillan',
            flight: '1',
            number: '9'},

           {first_name: 'Mike',
            last_name: 'Goodvich',
            flight: '1',
            number: '10'},

           {first_name: 'Ron',
            last_name: 'Carson',
            flight: '1',
            number: '11'},

           {first_name: 'Jim',
            last_name: 'Palazzolo',
            flight: '1',
            number: '12'},

           {first_name: 'John',
            last_name: 'Miles',
            flight: '2',
            number: 'A'},

           {first_name: 'Henry',
            last_name: 'Schoensee',
            flight: '2',
            number: 'B'},
                         
           {first_name: 'Gary',
            last_name: 'Landless', 
            suffix: 'Sr.',
            flight: '2',
            number: 'C'},

           {first_name: 'Walt',
            last_name: 'Bassa',
            flight: '2',
            number: 'D'},

           {first_name: 'Dave',
            last_name: 'Dely',
            flight: '2',
            number: 'E'},

           {first_name: 'Bob',
            last_name: 'Daniele',
            flight: '2',
            number: 'F'},

           {first_name: 'Sam',
            last_name: 'Schulte',
            flight: '2',
            number: 'G'},

           {first_name: 'Bill',
            last_name: 'Hoffsten',
            flight: '2',
            number: 'H'},

           {first_name: 'Dave',
            last_name: 'Bair',
            flight: '2',
            number: 'I'},

           {first_name: 'Tom',
            last_name: 'Schwartz',
            flight: '2',
            number: 'J'},

           {first_name: 'Keith',
            last_name: 'Meadows',
            flight: 'Sub',
            number: 'Sub'},

           {first_name: 'Ben',
            last_name: 'Schulte',
            flight: 'Sub',
            number: 'Sub'}]

players.each do |player|
  Player.create(player)
end














