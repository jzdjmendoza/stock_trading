class Admins::UsersController < AdminController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.where(role: :trader)
  end

  def show
    @transactions = @user.transactions
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.status = 'approved'

    if @user.save
      @user.confirm
      UserMailer.with(user: @user).status_email.deliver_later
      redirect_to admin_users_path
    end
  end

  def edit
  end

  def update
    @user.update(user_params.except(:id, :password, :password_confirmation))

    if user_params[:password].present? && user_params[:password_confirmation].present?
      @user.password = user_params[:password]
      @user.password_confirmation = user_params[:password_confirmation]
      @user.save
    end

    UserMailer.with(user: @user).status_email.deliver_later if user_params[:status].present?
    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:id, :status, :first_name, :last_name, :email, :password, :password, :role)
  end
end
