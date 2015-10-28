class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    File.open(product_params[:image]) do |f|
      @product.image = f
    end

    if @product.save
      flash[:success] = 'Product was successfully created'
      redirect_to @product
    else
      flash[:danger] = 'Invalid form input'
      render :new
    end
  end

  def update
    if @product.update(product_params)
      flash[:success] = 'Product was successfully updated'
      redirect_to @product
    else
      flash[:danger] = 'Invalid form input'
      render :edit
    end
  end

  def destroy
    @product.destroy
    flash[:success] = 'Product was successfully destroyed'
    redirect_to products_url
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :image)
    end
end
