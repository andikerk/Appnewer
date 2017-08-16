class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource
  skip_authorize_resource  only:  [:show, :index]

  def index
    
    @products = Product.all
    @a = params[:a]

    if params[:maxamount]
      @maxamount = params[:maxamount].to_i*100
    else
      @maxamount = 10000000000
  end
 

 





      if params[:q]
        search_term = params[:q]
        @products = Product.search(search_term)
      else
        @products = Product.all
      end


  end

  
  def show  
    @comments = @product.comments.order("created_at  DESC").paginate(page:params[:page], per_page: 2)
    @product.viewed!
  end
 
  def new
    @product = Product.new
  end

  def edit  
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end  
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :image_url, :price, :colour, :wheelsize)
    end

end
