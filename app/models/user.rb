class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :customer_company
  belongs_to :workplace
  has_and_belongs_to_many :roles
  belongs_to :created_user, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :updated_user, :class_name => "User", :foreign_key => "updated_user_id"

  #validates :customer_company_id , presence: true
  #validates :name , presence: true
  #validates :first_last_name , presence: true


  def full_name
    "#{name} #{first_last_name} #{second_last_name}"
  end

  def consortium_desc
    if consortium
      "Yes"
    else
      "No"
    end
  end

end
