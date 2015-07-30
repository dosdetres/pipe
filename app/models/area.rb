class Area < ActiveRecord::Base
  belongs_to :customer_company
  belongs_to :area_padre, :class_name=>"Area", :foreign_key => "area_id"
  has_many :areas, :class_name=>"Area", :foreign_key => "area_id"
  has_many :workplaces
  belongs_to :usuario_registra, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :usuario_actualiza, :class_name => "User", :foreign_key => "updated_user_id"

end
