class Traders::PortfolioController < TraderController
  def index
    @portfolios = []
    @total = 0

    current_user.portfolios.each do |portfolio|
      stock = helpers.client.quote(portfolio.stock)
      total = stock.latest_price * portfolio.shares
      @total = @total + total
      @portfolios.push({
        stock: portfolio.stock,
        current_price: stock.latest_price,
        total: total
      })
    end
  end
end
