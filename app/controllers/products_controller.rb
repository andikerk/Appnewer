class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource
  skip_authorize_resource  only:  [:show, :index]

  def index
    
    @products = Product.all  

    @men = params[:men]
    @women = params[:women]
    @children = params[:children]

#----------------------------order by-----------------
    if params[:orderBy]
      @orderBy= params[:orderBy]
    else
      @orderBy = [name: :asc]
    end
    
    
#---------------------max amount to spend------------------------
    if params[:maxamount]
      @maxamount = params[:maxamount].to_i*100
    else
     # @maxamount = Product.order(price: :desc).first.price + 100
     @maxamount = Product.maximum('price') + 100
    end
 
#--------------------------------search by letter--------------------------
    if params[:q]
      search_term = params[:q]
      @products = Product.search(search_term)
    else
      @products = Product.all
    end
#---------------------------paginate products----------------------
    if !@men&&!@women&&!@children
     @products = @products.paginate(page:params[:page], per_page:6).order( @orderBy).where("price < #{@maxamount}")
      
    
    else
      @products = @products.paginate(page:params[:page], per_page:6).
      where("category = '#{@men}' OR category = '#{@women}'OR category = '#{@children}'").
      order( @orderBy).where("price < #{@maxamount}")
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
      params.require(:product).permit(:name, :description, :image_url, :price, :colour, :wheelsize, :category)
    end

end
