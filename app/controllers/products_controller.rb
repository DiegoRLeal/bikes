class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = policy_scope(Product)
  end

  def show
    @user_cart = UserCart.new
    authorize @product

  end

  def new
    @product = Product.new
    authorize @product
  end

  def edit
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    @product.user = current_user
    if @product.save
      redirect_to @product, notice: "Product was sucessfully created."
    else
      render :new
    end
  end

  def update
    authorize @product
    if @product.update(product_params)
      redirect_to @product, notice: "Product was sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    authorize @product
    @product.destroy
    redirect_to products_url, notice: "Product was sucessfully destroyed."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:bike, :localization, :price, :bike_condition, photos: [])
  end
end
