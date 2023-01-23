class CreateRealEstates < ActiveRecord::Migration[7.0]
  def change
    create_table :real_estates do |t|
      t.string :title
      t.integer :price
      t.integer :area
      t.string :type
      t.text :poster_url

      t.timestamps
    end
  end
end
