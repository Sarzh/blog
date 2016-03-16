class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  #config.assets.initialize_on_precompile = false # for Heroku

  before_create :create_role #add role to user table before Sign Up

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  Roles = [ :admin , :default ]

  def is?( requested_role ) # CanCan method, look ability model
    self.role == requested_role.to_s
  end

  private

  def create_role
    self.role = :default
  end
end