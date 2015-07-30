class Permit < ActiveRecord::Base
  belongs_to :role
  belongs_to :menu_option
  belongs_to :usuario_registra, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :usuario_actualiza, :class_name => "User", :foreign_key => "updated_user_id"

end
