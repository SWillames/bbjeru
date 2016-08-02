class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create

    @sale = Sale.new(sale_params)
    @total = Sale.total
      if @sale.save
        redirect_to @sale, notice: 'Sale was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    params[:sale][:product_ids] ||= []
      if @sale.update(sale_params)
        redirect_to @sale, notice: 'Sale was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
      redirect_to sales_url, notice: 'Sale was successfully destroyed.'
  end

=begin  def products

      @sales = Sale.all
      @products = Product.all

      render :nested_products
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
      params.require(:sale).permit(:value, :client_id, :installments, product_ids: [])
    end
end
