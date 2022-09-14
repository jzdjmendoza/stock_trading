class Traders::TransactionController < TraderController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @transactions = current_user.transactions
  end

  def new
    @transaction = current_user.transactions.new(stock_symbol: params[:symbol], unit_price: params[:unit_price], transaction_type: params[:transaction_type])
  end

  def create
    @transaction = current_user.transactions.new(transaction_params)
    if @transaction.save
      redirect_to dashboard_path
    end
  end

  private

  def transaction_params
    params.permit(:id, :stock_symbol, :quantity, :unit_price, :transaction_type, :total_price, :user_id)
  end
end
