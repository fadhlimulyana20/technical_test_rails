class AddAuthorToBooks < ActiveRecord::Migration[6.0]
  def change
    change_table :authors do |t| 
      t.integer :book_id
    end
  end
end
