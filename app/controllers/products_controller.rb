class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = policy_scope(Product).order(created_at: :desc)
  end

  def show
  end

  def new
    @product = Product.new
    authorize @product
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    authorize @product

    if @product.save
      redirect_to @product, notice: "product was sucessfully created."
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "product was sucessfully updated."
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: "product was sucessfully destroyed."
  end

  private

  def set_product
    @product = Product.find(params[:id])
    authorize @product
  end

  def product_params
    params.require(:product).permit(:bike, :localization, :price, :bike_condition, :photos)
  end
end
