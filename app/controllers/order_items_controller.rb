class OrderItemsController < ApplicationController
  # move logged in check to before action
  
  def create
    product = Product.find(params[:order_item][:product_id])
    if logged_in?
      order_items = OrderItem.where(order: current_user.cart, product: product)
      if order_item = order_items.first
        order_item.quantity += params[:order_item][:quantity].to_i
      else
        order_item = OrderItem.new(order_item_params)
        order_item.order = current_user.cart
      end
      order_item.save
      flash[:success] = 'Product successfully added to cart'
      redirect_to product
    else
      flash[:danger] = 'Please log in to add this item to your cart'
      redirect_to product
    end
  end

  def update
  end

  def destroy
    OrderItem.find(params[:id]).destroy
    flash[:success] = 'Item successfully removed from cart'
    redirect_to cart_path
  end

  private

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity)
  end
end
