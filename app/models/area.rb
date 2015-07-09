class Area < ActiveRecord::Base
  belongs_to :customer_company
  belongs_to :area_padre, :class_name=>"Area", :foreign_key => "area_id"
  has_many :areas, :class_name=>"Area", :foreign_key => "area_id"
  has_many :workplaces
end
