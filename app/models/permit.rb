class Permit < ActiveRecord::Base
  belongs_to :role
  belongs_to :menu_option
end
