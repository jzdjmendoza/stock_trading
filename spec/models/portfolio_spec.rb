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
require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  describe 'validations' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:shares) }
    it { should validate_presence_of(:stock) }
  end
end
