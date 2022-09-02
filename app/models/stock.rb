# == Schema Information
#
# Table name: stocks
#
#  id             :bigint           not null, primary key
#  change         :decimal(15, 10)
#  company_name   :string
#  latest_price   :decimal(15, 10)
#  previous_close :decimal(15, 10)
#  symbol         :string
#  volume         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Stock < ApplicationRecord
end
