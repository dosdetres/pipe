class AddCustomerCompanyToUsers < ActiveRecord::Migration
  def self.up
    add_reference :users, :customer_company, index: true
  end

  def self.down
    remove_column :users, :customer_company_id
  end
end

