class CustomerCompany < ActiveRecord::Base
  belongs_to :empresa_padre, :class_name=>"CustomerCompany", :foreign_key => "customer_company_id"
  has_many :empresas, :class_name=>"CustomerCompany", :foreign_key => "customer_company_id"
  has_many :users


end
