require 'rails_helper'

RSpec.describe "Admins::UsersController", type: :request do
  fixtures :users
  before do
    user = User.create(first_name: 'Admin', last_name: 'Test', password: 'password', password_confirmation: 'password', email: 'admin@test.com', role: :admin)
    sign_in user
  end

  describe "GET /index" do
    it "access index" do
      get admin_users_url
      expect(response).to have_http_status(200)
    end
  end
end
