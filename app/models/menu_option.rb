class MenuOption < ActiveRecord::Base
  belongs_to :modulo_padre, :class_name => "MenuOption", :foreign_key => "menu_option_id"
  has_many :modulos, :class_name => "MenuOption", :foreign_key => "menu_option_id"
  has_many :permits
  belongs_to :usuario_registra, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :usuario_actualiza, :class_name => "User", :foreign_key => "updated_user_id"

  validates :modulo , presence: true
  validates :orden , presence: true, numericality: { only_integer: true }

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
