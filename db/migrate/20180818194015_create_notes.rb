class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :university
      t.string :degree
      t.string :subject
      t.string :semester
      t.string :description
      t.string :attachment

      t.timestamps
    end
  end
end
