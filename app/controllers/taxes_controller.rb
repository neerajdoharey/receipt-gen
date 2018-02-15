class TaxesController < ApplicationController
	before_action :required_user
  before_action :set_tax, except: [:index, :new, :create]

  def index
  	@taxes = Tax.all
  end

  def new
  	@tax = Tax.new
  end

  def create
  	@tax = Tax.new(tax_params)
    if @tax.save
      flash[:success] = "Tax successfully created..."
      redirect_to taxes_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @tax.update(tax_params)
      flash[:success] = "Tax was Successfully updated..."
      redirect_to taxes_path(@article)
    else
      render 'edit'
    end
  end
  private
  def set_tax
    @tax = Tax.find(params[:id])
  end

  def tax_params
  	params.require(:tax).permit(:gst_ratio, :cgst_ratio, :sgst_ratio)
  end
end
