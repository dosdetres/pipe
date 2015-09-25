class CustomerCompany < ActiveRecord::Base
  belongs_to :up_company, :class_name=>"CustomerCompany", :foreign_key => "customer_company_id"
  has_many :companies, :class_name=>"CustomerCompany", :foreign_key => "customer_company_id"
  has_many :users
  belongs_to :created_user, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :updated_user, :class_name => "User", :foreign_key => "updated_user_id"

  validates :company_customer , presence: true

  def consortium_desc
    if consortium
      "Yes"
    else
      "No"
    end
  end

  def active_desc
    if active
      "Yes"
    else
      "No"
    end
  end

end
