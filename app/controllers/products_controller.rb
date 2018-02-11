class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]
  before_action :required_user
  def new
  	@product = Product.new
  end

  def index
  	@products = Product.all
  end

  def create
  	@product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product successfully created..."
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Product was Successfully updated..."
      redirect_to products_path(@article)
    else
      render 'edit'
    end
  end

  def show
    
  end

  def destroy
    @product.destroy
    flash[:danger] = "Product was Successfully Deleted..."
    redirect_to products_path
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
  	params.require(:product).permit(:name, :sku, :description)
  end
end
