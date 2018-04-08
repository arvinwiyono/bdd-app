class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.belongs_to :user, foreign_key: true
      t.string :name
      t.string :author

      t.timestamps
    end
  end
end
