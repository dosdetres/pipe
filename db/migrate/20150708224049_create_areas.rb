class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :area
      t.string :description
      t.integer :order
      t.boolean :active
      t.integer :created_user_id
      t.integer :updated_user_id
      t.references :customer_company, index: true
      t.references :area, index: true

      t.timestamps
    end
  end
end
