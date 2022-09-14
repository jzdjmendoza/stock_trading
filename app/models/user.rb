# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  is_approved            :boolean          default(FALSE)
#  last_name              :string           not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer          not null
#  status                 :string           default("pending")
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: [:trader, :admin]

  validates_presence_of :email, :first_name, :last_name, :role, :status

  has_many :transactions, foreign_key: :user_id
  has_many :portfolios, foreign_key: :user_id

  after_initialize :set_default_role, if: :new_record?

  scope :admin, -> { where(role: :admin) }
  scope :trader, -> { where(role: :trader) }
  scope :role_type, ->(r_type) { where(role: r_type)}

  def set_default_role
    self.role ||= :trader
  end
end
