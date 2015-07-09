class Role < ActiveRecord::Base
  belongs_to :customer_company
  has_many :permits
  has_and_belongs_to_many :users
end
