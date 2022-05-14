class UserCartsController < ApplicationController
  def new
    @product = Product.find(params[:products_id])
    @user_cart = UserCart.new
  end

  def create
    @product = Product.find(params[:products_id])
    @user_cart = UserCart.new(user_cart_params)
    @user_cart.product = @product
    @user_cart.user = current_user
    if @user_cart.save
      redirect_to product_path(@user_cart.product)
    else
      render 'products/show'
    end
  end

  def index
    @products = policy_scope(Product)
    @user_cart = current_user.user_carts
    #authorize @product
    #authorize @user_cart
  end

  private

  def user_cart_params
    params.require(:user_cart).permit(:status, :product)
  end
end
