class User < ActiveRecord::Base

  include Authentication

  attr_accessor :password

  email_regex = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  # # Validations
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: email_regex }
  validates :password, presence: true,
                       confirmation: true
  validates :password_confirmation, presence: true

  # # Associations
  # has_many :tasks

  # # Callbacks
  before_create :generate_fake_name, unless: :name?

  def self.fields
    puts column_names.sort
  end


  private

  def generate_fake_name
    self.name = Faker::Name.name
  end

end