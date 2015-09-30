class Area < ActiveRecord::Base
  belongs_to :customer_company
  belongs_to :up_area, :class_name=>"Area", :foreign_key => "area_id"
  has_many :areas, :class_name=>"Area", :foreign_key => "area_id"
  has_many :workplaces
  belongs_to :created_user, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :updated_user, :class_name => "User", :foreign_key => "updated_user_id"

  validates :customer_company_id , presence: true
  validates :area, presence: true

  def active_desc
    if active
      "views.messages.text_yes"
    else
      "views.messages.text_no"
    end
  end

end
