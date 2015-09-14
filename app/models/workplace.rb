class Workplace < ActiveRecord::Base
  belongs_to :area
  belongs_to :usuario_registra, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :usuario_actualiza, :class_name => "User", :foreign_key => "updated_user_id"

  validates :area_id , presence: true
  validates :puesto, presence: true

  def activo_desc
    if activo
      "Si"
    else
      "No"
    end
  end

end
