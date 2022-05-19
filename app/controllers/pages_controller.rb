class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @products_home = Product.all
  end
end
