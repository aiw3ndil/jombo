# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(email: 'albert.oliva@gmail.com', password: '123456')
Profile.create(first_name: 'Albert', last_name: 'Oliva', username: 'alolve', user:)

user = User.create(email: 'narovi.terminus@gmail.com', password: '123456')
Profile.create(first_name: 'Narovi', last_name: 'Terminus', username: 'narovi', user:)
