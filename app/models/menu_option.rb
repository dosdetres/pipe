class MenuOption < ActiveRecord::Base
  belongs_to :modulo_padre, :class_name=>"MenuOption", :foreign_key => "menu_option_id"
  has_many :modulos, :class_name=>"MenuOption", :foreign_key => "menu_option_id"
  has_many :permits
end
