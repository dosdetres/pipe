class CreateCustomerCompanies < ActiveRecord::Migration
  def change
    create_table :customer_companies do |t|
      t.string :empresa_cliente
      t.string :rfc
      t.string :razon_social
      t.boolean :consorcio
      t.boolean :activo
      t.integer :created_user_id
      t.string :updated_user_id

      t.timestamps
    end
  end
end
