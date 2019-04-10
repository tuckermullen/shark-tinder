shark_attributes = [
  {
    name: 'Jows',
    age: 24,
    enjoys: 'Night time hunts by the reef.'
  },
  {
    name: 'Homer',
    age: 12,
    enjoys: 'Surfers in wet suits.'
  }
]

shark_attributes.each do |attributes|
  Shark.create(attributes)
end