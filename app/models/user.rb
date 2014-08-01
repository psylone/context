class User < ActiveRecord::Base

  attr_accessor :password

  email_regex = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  # Validations
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: email_regex }
  validates :password, presence: true,
                       confirmation: true, on: :create
  validates :password_confirmation, presence: true

  # Associations
  # has_many :tasks

  # Callbacks
  before_save :hash_password

  def self.authenticate email, password
    user = where(email: email).first
    if user && user.hashed_password == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end


  private

  def hash_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

end
