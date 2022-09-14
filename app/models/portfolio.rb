# == Schema Information
#
# Table name: portfolios
#
#  id         :bigint           not null, primary key
#  shares     :integer
#  stock      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_portfolios_on_user_id  (user_id)
#
class Portfolio < ApplicationRecord
  belongs_to :user

  validates_presence_of :shares, :stock
end
