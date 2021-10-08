# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cats = Cat.create([{birth_date: "2015/01/20", color: "cyan", name: "Mark", sex: "M", description: "first cat"},
{birth_date: "2021/01/20", color: "zebra", name: "Andy", sex: "M", description: "in honor of Andy Huang"}
])