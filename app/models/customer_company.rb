class CustomerCompany < ActiveRecord::Base
  belongs_to :up_company, :class_name=>"CustomerCompany", :foreign_key => "customer_company_id"
  has_many :companies, :class_name=>"CustomerCompany", :foreign_key => "customer_company_id"
  has_many :users
  has_one :belief
  has_one :external_context
  has_one :global_strategy
  has_one :growth_vector
  has_one :growth_vector_detail
  has_one :internal_context
  has_one :market_context
  has_one :opportunity
  has_one :risk
  has_one :social_responsability
  has_one :sustainability
  belongs_to :created_user, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :updated_user, :class_name => "User", :foreign_key => "updated_user_id"

  validates :company_customer , presence: true

  def consortium_desc
    if consortium
      "views.messages.text_yes"
    else
      "views.messages.text_no"
    end
  end

  def active_desc
    if active
      "views.messages.text_yes"
    else
      "views.messages.text_no"
    end
  end

end
