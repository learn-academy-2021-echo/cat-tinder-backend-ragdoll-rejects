# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cats = [
  {
    name: 'Bellatrix',
    age: 1,
    enjoys: 'Sneaking into places shes not allowed to go.',
    image: 'https://www.google.com/search?q=black+cat+jpg&tbm=isch&ved=2ahUKEwjx25Kh3Ob1AhWfAjQIHdgaCqQQ2-cCegQIABAA&oq=black+cat+jpg&gs_lcp=CgNpbWcQAzIFCAAQgAQ6BwgjEO8DECc6BAgAEEM6BwgAELEDEEM6CggAELEDEIMBEEM6CAgAEIAEELEDOgYIABAKEBhQrSxY8kVgm0hoAHAAeACAAZIBiAGdDpIBBDAuMTSYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=J3b9YbGsIJ-F0PEP2LWooAo&bih=853&biw=1600#imgrc=FJMEVJFcH_6fZM'
  },
  {
    name: 'Kylo',
    age: 2,
    enjoys: 'Playing with everything except his toys.',
    image: 'https://www.google.com/search?q=gray+cat+jpg&tbm=isch&ved=2ahUKEwjJrP-n3Ob1AhXkAjQIHf9gCoUQ2-cCegQIABAA&oq=gray+cat+jpg&gs_lcp=CgNpbWcQAzoECAAQQzoGCAAQBxAeOggIABAIEAcQHlD2D1ifFGDrGGgAcAB4AIABigGIAYoFkgEDMC41mAEAoAEBqgELZ3dzLXdpei1pbWfAAQE&sclient=img&ei=NXb9YYm-NuSF0PEP_8GpqAg&bih=853&biw=1600#imgrc=eU1Vma6-LOSvjM'
  },
  {
    name: 'Bartholomeow',
    age: 8,
    enjoys: 'Loves scratching furniture and getting into the trash.',
    image: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fm.facebook.com%2Fthecathouse%2Fphotos%2Fa.230099260347%2F10159390563515348%2F%3Fcomment_id%3D10159390576930348%26reply_comment_id%3D10159394258940348&psig=AOvVaw1LiCmR5Ioq2jZKLXqizMDD&ust=1644087931957000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIjq7ILf5vUCFQAAAAAdAAAAABAD'
  },
  {
    name: 'Hades',
    age: 6,
    enjoys: 'Scratching the dog and then running away. He also enjoys knocking everything off the counter.',
    image: 'https://www.google.com/search?q=evil+cat+jpg&tbm=isch&ved=2ahUKEwiVpbfY3-b1AhUpAzQIHQ7RASoQ2-cCegQIABAA&oq=evil+cat+jpg&gs_lcp=CgNpbWcQAzoHCCMQ7wMQJ1DbBFjbBGCaDmgAcAB4AIAB1wGIAY8DkgEFMC4xLjGYAQCgAQGqAQtnd3Mtd2l6LWltZ8ABAQ&sclient=img&ei=wHn9YZXFL6mG0PEPjqKH0AI&bih=853&biw=1600#imgrc=VbMeaNTgRAvaMM&imgdii=nsE5EgYfwWhhpM'
  }
]

cats.each do |each_cat|
  Cat.create each_cat
  puts "generating cat #{each_cat}"
end
