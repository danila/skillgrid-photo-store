class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :pro]

  def index
    @products = policy_scope(Product)
    unless logged_in?
      flash.now[:danger] = "Please #{view_context.link_to 'Log In', login_path}
                        or #{view_context.link_to 'Sign Up', signup_path}
                        to view the list of products".html_safe
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    @product.user_id = current_user.id if current_user

    if @product.save
      flash[:success] = 'Product was successfully created'
      redirect_to @product
    else
      flash[:danger] = 'Invalid form input'
      render :new
    end
  end

  def update
    authorize @product
    if @product.update(product_params)
      flash[:success] = 'Product was successfully updated'
      redirect_to @product
    else
      flash[:danger] = 'Invalid form input'
      render :edit
    end
  end

  def destroy
    authorize @product
    @product.destroy
    flash[:success] = 'Product was successfully destroyed'
    redirect_to products_url
  end

  def pro
    authorize @product

    @product.toggle(:pro)
    if @product.save
      flash[:success] = 'Product was marked as PRO'
    end

    render :show
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :image, :user_id)
    end
end
