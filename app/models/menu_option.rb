class MenuOption < ActiveRecord::Base
  belongs_to :up_module, :class_name => "MenuOption", :foreign_key => "menu_option_id"
  has_many :modules, :class_name => "MenuOption", :foreign_key => "menu_option_id"
  has_many :permits
  belongs_to :created_user, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :updated_user, :class_name => "User", :foreign_key => "updated_user_id"

  validates :module , presence: true
  validates :order , presence: true, numericality: { only_integer: true }

  def consortium_desc
    if consortium
      "messages.text_yes"
    else
      "messages.text_no"
    end
  end

  def active_desc
    if active
      "messages.text_yes"
    else
      "messages.text_no"
    end
  end

end
