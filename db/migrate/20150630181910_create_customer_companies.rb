class CreateCustomerCompanies < ActiveRecord::Migration
  def change
    create_table :customer_companies do |t|
      t.string :company_customer
      t.string :rfc
      t.string :registered_name
      t.boolean :consortium
      t.boolean :active
      t.integer :created_user_id
      t.string :updated_user_id

      t.timestamps
    end
  end
end
