class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to @product, notice: 'Cadastro realizado com sucesso'
  	else
  		render :new
  	end
  end

  def show
  	@product = Product.find(params[:id])
  end

  def edit
  	@product = Product.find(params[:id])
  end

  def update
  	@product = Product.find(params[:id])
  	if @product.update(product_params)
  		redirect_to @product, notice: 'Cadastro atualizado com sucesso!'
  	else
  		render :edit
  	end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'producte deletado com sucesso!'
  end

  private
  def product_params
  	params.require(:product).permit(:name, :price, :mark, :description)
  end
end
