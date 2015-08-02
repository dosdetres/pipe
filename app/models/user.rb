class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :customer_company
  belongs_to :workplace
  has_and_belongs_to_many :roles
  belongs_to :usuario_registra, :class_name => "User", :foreign_key => "created_user_id"
  belongs_to :usuario_actualiza, :class_name => "User", :foreign_key => "updated_user_id"

  validates :customer_company_id , presence: true
  validates :nombre , presence: true
  validates :apellido_paterno , presence: true


  def nombre_completo
    "#{nombre} #{apellido_paterno} #{apellido_materno}"
  end

  def consorcio_desc
    if consorcio
      "Si"
    else
      "No"
    end
  end


end
