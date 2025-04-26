# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "json"

puts "Cleaning everything..."

# Delete dependent records first
Chapter.destroy_all

# Now, delete the users
User.destroy_all

puts "Database cleaned."


odin_filepath = File.join(__dir__, "odin_curriculum.json")
serialized_curriculum = File.read(odin_filepath)
odin_chapters = JSON.parse(serialized_curriculum)

odin_chapters.each do |chapter|
  new_chapter = Chapter.find_or_create_by!(
    name: chapter["chapter_title"],
    icon: chapter["chapter_icon"],
    description: chapter["chapter_description"],
    overview: chapter["chapter_overview"],
    source: "the_odin_project"
  )
  puts "Created chapter #{new_chapter.name}"
end

puts "Everything created for The Odin Project!"


le_filepath = File.join(__dir__, "le_data.json")
le_serialized_data = File.read(le_filepath)
data = JSON.parse(le_serialized_data)

le_chapters = data["chapters"]

le_chapters.each do |chapter|
  Chapter.create!(
    name: chapter["title"],
    url: chapter["url"],
    icon: chapter["icon"]
  )
end

puts "Chapters created successfully!"
