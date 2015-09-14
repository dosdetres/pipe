class Role < ActiveRecord::Base
  belongs_to :customer_company
  has_many :permits
  has_and_belongs_to_many :users
  belongs_to :usuario_registra, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :usuario_actualiza, :class_name => "User", :foreign_key => "updated_user_id"


  validates :customer_company_id , presence: true
  validates :rol, presence: true


  def activo_desc
    if activo
      "Si"
    else
      "No"
    end
  end

end
