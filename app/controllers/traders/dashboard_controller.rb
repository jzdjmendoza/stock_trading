class Traders::DashboardController < TraderController
  skip_before_action :default_to_dashboard, only: :index
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    if params[:search]
      begin
        @stock = helpers.client.quote(params[:search])
      rescue IEX::Errors::SymbolNotFoundError
        @stock = nil
      end
    end

    begin
      @stocks = helpers.client.stock_market_list(:mostactive)
    rescue IEX::Errors::SymbolNotFoundError
      @stocks = []
    end

    @transactions = current_user.transactions
  end
end
