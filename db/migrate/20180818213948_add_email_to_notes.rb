class AddEmailToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :email, :string
  end
end
