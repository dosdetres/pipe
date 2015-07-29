class MenuOption < ActiveRecord::Base
  belongs_to :modulo_padre, :class_name=>"MenuOption", :foreign_key => "menu_option_id"
  has_many :modulos, :class_name=>"MenuOption", :foreign_key => "menu_option_id"
  has_many :permits

  validates :modulo , presence: true
  validates :orden , presence: true, numericality: { only_integer: true }
  validates :ruta , presence: true

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
