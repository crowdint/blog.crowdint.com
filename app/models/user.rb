class User < ActiveRecord::Base
  include Gravtastic

  has_many :authored_posts, inverse_of: :author, foreign_key: 'author_id', class_name: 'Post'

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :token_authenticatable, :trackable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  gravtastic :gravatar_email

  validate :email, uniqueness: true

  def publisher!
    update_attribute(:is_publisher, true)
  end

  def gravatar_email
    (gravatar_alias || email)
  end
end
