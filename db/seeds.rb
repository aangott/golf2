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
            number: '4',
            starting_avg: '40'},

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

scores = [[40, 43, 36, 36, 38, 40, 33, 42, 36, 40, 39],
          [39, 38, 37, 39, 38, 41, 37, 41, 40, 41, 41],
          [41, 37, 41, 38, 36, 37, 39, 38, 39, 44, 44],
          [],
          [41, 40, 38, 43, 38, 40, 49, 42, 43, 39, 41],
          [39, 45, 39, 38, 44, 41, 41, 39, 42, 43, 42],
          [45, 46, 41, 43, 42, 39, 42, 42, 43, 42, 44],
          [41, 46, 44, 41, 42, 44, 42, 46, 40, 45, 43],
          [39, 40, 41, 45, 43, 47, 46, 46],
          [47, 40, 43, 45, 42, 45, 42, 44, 40, 52, 46],
          [41, 42, 45, 43, 44, 46, 42, 50, 46, 46, 48],
          [44, 42, 46, 39, 46, 44, 50, 47, 44, 46, 46],

          [45, 44, 42, 45, 45, 49, 41, 50, 43, 43, 45],
          [43, 46, 43, 49, 41, 46, 44, 51, 48, 51, 51],
          [46, 48, 47, 50, 40, 51, 39, 47, 45, 49, 50],
          [45, 44, 48, 41, 45, 48, 51, 45, 43, 48, 46],
          [47, 47, 46, 49, 46, 52, 42, 49, 46, 42, 49],
          [46, 47, 47, 52, 51, 51, 45, 44, 41, 48, 51],
          [45, 47, 48, 49, 45, 51, 42, 54, 51, 43, 45],
          [50, 49, 46, 46, 48, 52, 47, 46, 47, 54, 53],
          [46, 49, 51, 49, 48, 52, 54, 48, 51, 50, 52],
          [56, 58, 51, 58, 50, 57, 54, 54, 53, 53, 46],

          [40, 39, 41, 34, 38, 42, 46, 44, 41, 39, 35],
          [44, 52, 54, 48]]

players.each_with_index do |player, idx|
  new_player = Player.create(player)
  
  if idx < scores.length
    p_scores = scores[idx].reverse
    p_scores.each do |score|
      s = Score.new
      s.value = score
      s.player_id = new_player.id
      s.save
    end
  end
end














