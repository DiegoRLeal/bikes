class UserCartsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @user_cart = UserCart.new
  end

  def create
    @product = Product.find(params[:product_id])
    @user_cart = UserCart.new(user_cart_params)
    #authorize @user_cart
    @user_cart.product = @product
    @user_cart.user = current_user
    if @user_cart.save
      redirect_to user_carts_path(@user_cart)
    else
      render 'products/show'
    end
  end

  def index
    @products = Product.all
    #@user_carts = policy_scope(UserCart)
    @user_carts = current_user.user_carts

  end

  def destroy
    @user_cart = UserCart.find(params[:id])
    @user_cart.destroy
    redirect_to user_carts_path
  end

  private

  def user_cart_params
    params.require(:user_cart).permit(:product_id, :status)
  end
end
