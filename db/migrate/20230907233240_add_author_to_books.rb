class AddAuthorToBooks < ActiveRecord::Migration[6.0]
  def change
    change_table :books do |t|
      t.integer :author_id
    end
  end
end
