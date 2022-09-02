# == Schema Information
#
# Table name: transactions
#
#  id               :bigint           not null, primary key
#  quantity         :integer
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
class Transaction < ApplicationRecord
end
