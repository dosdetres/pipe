class CreateGrowthVectorDetails < ActiveRecord::Migration
  def change
    create_table :growth_vector_details do |t|
      t.references :customer_company, index: true
      t.text :text
      t.integer :created_user_id
      t.integer :updated_user_id

      t.timestamps
    end
  end
end
