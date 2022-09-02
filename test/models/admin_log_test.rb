# == Schema Information
#
# Table name: admin_logs
#
#  id          :bigint           not null, primary key
#  action      :string
#  admin_type  :string
#  trader_type :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  admin_id    :bigint
#  trader_id   :bigint
#
# Indexes
#
#  index_admin_logs_on_admin   (admin_type,admin_id)
#  index_admin_logs_on_trader  (trader_type,trader_id)
#
require "test_helper"

class AdminLogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
