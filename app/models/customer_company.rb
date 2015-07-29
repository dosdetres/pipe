class CustomerCompany < ActiveRecord::Base
  belongs_to :empresa_padre, :class_name=>"CustomerCompany", :foreign_key => "customer_company_id"
  has_many :empresas, :class_name=>"CustomerCompany", :foreign_key => "customer_company_id"
  has_many :users

  validates :empresa_cliente , presence: true


  def consorcio_desc
    if consorcio
      "Si"
    else
      "No"
    end
  end

  def activo_desc
    if activo
      "Si"
    else
      "No"
    end
  end



end
