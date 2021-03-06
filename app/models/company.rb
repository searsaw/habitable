class Company < ActiveRecord::Base
  attr_accessor :user_comparison
  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  has_many :profiles, foreign_key: 'user_id'
  has_many :questions, through: :profiles, foreign_key: 'user_id'

  def location
    "#{city}, #{state} #{zip[0..4]}"
  end
end
