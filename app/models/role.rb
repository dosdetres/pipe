class Role < ActiveRecord::Base
  belongs_to :customer_company
  has_many :permits
  has_and_belongs_to_many :users
  belongs_to :created_user, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :updated_user, :class_name => "User", :foreign_key => "updated_user_id"


  validates :customer_company_id , presence: true
  validates :role, presence: true


  def active_desc
    if active
      "messages.text_yes"
    else
      "messages.text_no"
    end
  end

end
