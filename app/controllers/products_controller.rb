class ProductsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]
  
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
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = 'Product successfully created.'
      redirect_to products_path
    else
      render new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = 'Product successfully deleted.'
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :category_id)
  end
end
