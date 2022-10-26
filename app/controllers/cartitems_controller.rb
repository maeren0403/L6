class CartitemsController < ApplicationController
  def new
    @cartitem = Cartitem.new(product_id: params[:product_id])
  end

  def create
    cart = Cartitem.new(product_id: params[:cartitem][:product_id],
    cart_id: current_cart.id, qty: params[:cartitem][:qty], )
    cart.save
    redirect_to '/carts/show'
  end

  def destroy
    @cartitem = Cartitem.find(params[:id])
    @cartitem.destroy
    flash[:notice] = '1レコード削除しました'
    redirect_to root_path
  end
end
