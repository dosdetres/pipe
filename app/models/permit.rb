class Permit < ActiveRecord::Base
  belongs_to :role
  belongs_to :menu_option
  belongs_to :created_user, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :updated_user, :class_name => "User", :foreign_key => "updated_user_id"

end
