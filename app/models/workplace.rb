class Workplace < ActiveRecord::Base
  belongs_to :area
  belongs_to :created_user, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :updated_user, :class_name => "User", :foreign_key => "updated_user_id"

  validates :area_id , presence: true
  validates :position, presence: true

  def active_desc
    if active
      "messages.text_yes"
    else
      "messages.text_no"
    end
  end

end
