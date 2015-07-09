class AddCustomerCompanyToCustomerCompanies < ActiveRecord::Migration
  def self.up
    add_reference :customer_companies, :customer_company, index: true
  end

  def self.down
    remove_column :customer_companies, :customer_company_id
  end
end
