class CatalogsController < ApplicationController
  include Pagy::Backend
  before_action :set_catalog, only: [:show, :update, :destroy]

  # GET /catalogs
  def index
    if params[:page] == "all"
      @catalogs = Catalog.all
      render json: { catalogs: @catalogs }
    else
      pagy, catalogs = pagy(Catalog.sorted)
      render json: catalogs, meta: pagy_metadata(pagy,true), adapter: :json
    end

  end

  # GET /catalogs/1
  def show
    render json: @catalog
  end

  # POST /catalogs
  def create
    @catalog = Catalog.new(catalog_params)

    if @catalog.save
      render json: @catalog, status: :created, location: @catalog
    else
      render json: {error: @catalog.errors.full_messages.join(",")}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /catalogs/1
  def update
    if @catalog.update(catalog_params)
      render json: @catalog
    else
      render json: @catalog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /catalogs/1
  def destroy
    @catalog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog
      @catalog = Catalog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def catalog_params
      params.require(:catalog).permit(:name, :unit, :price, :image, :category_id)
    end
end
