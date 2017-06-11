class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
