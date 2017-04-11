require "csv"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seeding for works
works = []

CSV.foreach("media_seeds.csv", { :headers => true }) do |line|
  works << {category: line[0], title: line[1], creator: line[2], publication_year: line[3], description: line[4]}
end

success_count = 0

works.each do |work|
  temp_work = Work.create(work)
  if temp_work.id
    success_count += 1
    puts "#{temp_work.title} successfully added"
  end
end

puts "#{success_count} out of #{works.length} successfully added"
