
house = {
  less_fancy_name: 'palace',
  bedroom: [
   'bed',
   'dresser',
   'night stand'
  ],
  kitchen: [
    'table',
    'chairs'
  ],
  bathroom: [
    'toilet',
    'shower/tub',
    'sink'
  ],
  living_room: [
    'couch',
    'coffe table',
    'TV'
  ],
  garge: {
    less_fancy_name: 'car hold',
    number_of_cars: 2,
    number_of_shovels: 5
  },
}

puts house
puts
puts house[:less_fancy_name]
puts
puts house[:bedroom]
puts
puts house[:bedroom].reverse
puts
puts house[:living_room].count
puts house[:living_room]
puts house[:living_room][0]
puts house[:living_room][2]
puts
puts house[:garge][:less_fancy_name].upcase
puts house[:garge][:number_of_cars]
puts house[:garge][:number_of_shovels]
puts
puts house[:kitchen]
puts
house[:kitchen].push('fridge', 'stove', 'dishwaser')
puts house[:kitchen]