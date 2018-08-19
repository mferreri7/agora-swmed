# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Note.destroy_all

require 'csv'

filepath = 'Apuntes Ágora - Hoja 1.csv'
csv_options = { headers: :first_row }

CSV.foreach(filepath, csv_options) do |row|
  a = Note.create(
    university: row[1],
    degree: row[2],
    subject: row[3],
    semester: row[4],
    description: row[5],
    email: row[9],
  )

  a.save!
end
