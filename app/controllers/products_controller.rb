class ProductsController < ApplicationController
  before_action :set_product,
                only: [:show, :edit, :update, :destroy, :pro, :buy]

  def index
    @products = policy_scope(Product)
    unless logged_in?
      flash.now[:danger] = "Please #{view_context.link_to 'Log In', login_path}
                        or #{view_context.link_to 'Sign Up', signup_path}
                        to see all products".html_safe
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
    redirect_to :product
  end

  def buy
    authorize @product

    photo = JSON.parse(HTTP.get('http://jsonplaceholder.typicode.com/photos/' +
                                                      rand(1..500).to_s).body)
    GuestMailer.purchase_email(current_user, photo).deliver_later

    purchase = JSON.parse(
                HTTP.post('http://jsonplaceholder.typicode.com/todos').body)
    AdminMailer.new_purchase(current_user, purchase).deliver_later

    flash.now[:success] = 'Thank you for purchasing!'
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
