class ProductsController < ApplicationController
def create
  @product = Product.create(product_params)
  @product.category = Category.find(params[:category_id])
  @product.save

  redirect_to @product.category, notice: 'Guardado'
end

def destroy
  @product = Product.find(params[:id])
  @category = @product.category
  @product.destroy

  redirect_to @category, alert: 'Producto Eliminado'
end

  private
  def product_params
    params.require(:product).permit(:name, :price)
  end
end
