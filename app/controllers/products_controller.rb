class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
  end
end
