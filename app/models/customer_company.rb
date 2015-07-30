class CustomerCompany < ActiveRecord::Base
  belongs_to :empresa_padre, :class_name=>"CustomerCompany", :foreign_key => "customer_company_id"
  has_many :empresas, :class_name=>"CustomerCompany", :foreign_key => "customer_company_id"
  has_many :users
  belongs_to :usuario_registra, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :usuario_actualiza, :class_name => "User", :foreign_key => "updated_user_id"

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
