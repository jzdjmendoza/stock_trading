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
class Transaction < ApplicationRecord
  belongs_to :user

  validates_presence_of :quantity, :transaction_type, :unit_price, :stock_symbol
  
  validate :can_be_sold
  before_create :check_total_price
  after_create :update_trader_portfolio

  def evaluate(value1, value2)
    case transaction_type.to_sym
    when :buy
      value1 + value2
    when :sell
      value1 - value2
    end
  end

  def can_be_sold
    return if transaction_type == 'buy'
    
    errors.add('Nothing to sell') unless user.portfolios.find_by(stock: stock_symbol).present?
  end

  private
  def check_total_price
    return if total_price &&total_price > 0

    self.total_price = quantity * unit_price
  end

  def update_trader_portfolio
    portfolio = user.portfolios.find_or_initialize_by(stock: stock_symbol)

    if portfolio.persisted?
      portfolio.shares = evaluate(portfolio.shares, quantity)
    else
      portfolio.shares = evaluate(0, quantity)
    end

    portfolio.save
  end
end
