# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

todos = Todo.create([{ title: 'watch Star Wars', body: 'body 1', done: false }, 
                    { title: 'watch Lord of the Rings', body: 'body 2', done: false },
                    { title: 'watch Harry Potter', body: 'body 3', done: false }])