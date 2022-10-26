class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
     @product =  Product.new(name: params[:product][:name], price: params[:product][:price])
    if @product.save
      flash[:notice] = '1レコード追加しました'
      redirect_to root_path
    else
      render product_new_path
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = '1レコード削除しました'
    redirect_to root_path
  end
end
