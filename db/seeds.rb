# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.create(title: 'My best metal',
	description:
		%{<p>
			Ruby is th e f a s t e s t growing and most e x c it in g dynamic language
			out th e re . I f you need to get working programs d e liv e re d f a s t ,
			you should add Ruby to your to o lb o x .

		  </p>},
	image_url: '1.jpg',
	price: 99.95)