# == Schema Information
#
# Table name: transactions
#
#  id               :bigint           not null, primary key
#  quantity         :integer
#  stock_symbol     :string
#  total_price      :decimal(15, 10)
#  transaction_type :string
#  unit_price       :decimal(15, 10)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  stock_id         :bigint
#  user_id          :bigint
#
# Indexes
#
#  index_transactions_on_stock_id  (stock_id)
#  index_transactions_on_user_id   (user_id)
#

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe 'validations' do
    it { should belong_to(:user) }    
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:transaction_type) }
    it { should validate_presence_of(:unit_price) }
    it { should validate_presence_of(:stock_symbol) }
  end
end
