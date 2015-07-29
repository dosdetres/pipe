class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :customer_company
  has_and_belongs_to_many :roles




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
