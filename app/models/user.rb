class User < ActiveRecord::Base

  has_secure_password

  has_many :posts

  validates :email, :uniqueness => {:case_sensitive => false}, presence: true
  validates :name, presence: true, length: {minimum: 0, maximum: 20}
  validates :password, presence: true, length: {minimum: 8, maximum: 1000}

  validates_confirmation_of :password, on: :create
  validates_presence_of :password_confirmation

  def self.authenticate name,password
    User.find_by_name(name).try(:authenticate, password)
  end

end
