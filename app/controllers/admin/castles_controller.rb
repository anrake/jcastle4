class Admin::CastlesController < ApplicationController
  before_action :set_castle, only: [:show, :edit, :update, :destroy]

  # GET /castles
  # GET /castles.json
  def index
    @castles = Castle.all.order("approved ASC, id DESC")
  end

  # GET /castles/1
  # GET /castles/1.json
  def show
    @cpictures = @castle.photos.order("vieworder ASC")
    @photo = Photo.new
    @castle.photos.build
  end

  # GET /castles/new
  def new
    @castle = Castle.new
  end

  # GET /castles/1/edit
  def edit
#    @photo = Photo.new
#    @castle.photos.build
  end

  # POST /castles

  # POST /castles.json
  def create
    @castle = Castle.new(castle_params)

    respond_to do |format|
      if @castle.save
        format.html { redirect_to admin_castle_path(@castle), notice: 'Castle was successfully created in Admin Controller.' }
        format.json { render action: 'show', status: :created, location: @castle }
      else
        format.html { render action: 'new' }
        format.json { render json: @castle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /castles/1
  # PATCH/PUT /castles/1.json
  def update
#    @photo = Photo.new
#    @castle.photos.build(castle_params)
    respond_to do |format|
      if @castle.update(castle_params)
        format.html { redirect_to admin_castle_path, notice: 'Castle was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @castle }
      else
        format.html { render action: 'edit' }
        format.json { render json: @castle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /castles/1
  # DELETE /castles/1.json
  def destroy
    @castle.destroy
    respond_to do |format|
      format.html { redirect_to admin_castles_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_castle
      @castle = Castle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def castle_params
      params.require(:castle).permit(:castle_name_en, :castle_name_ja, :castle_name_alt, :founder, :kamon, :kamon_fam, :year, :year_reconstructed, :structure, :artifacts, :visited, :location, :pro_web_name, :website, :clatitude, :clongitude, :gmapicn, :bestZoom, :bestMap, :visitorInfo, :timeRequired, :access, :manualUpdate, :ekiLatLng, :condition, :castle_type, :prefecture, :rating, :year_visited, :period, :historical_value, :top_100, :has_NT, :has_ICP, :unesco, :destination, :notes, :notesJse, :history, :shortdesc, :has_ishigaki, :has_buildings)
    end

    def photo_params
#      params.require(@photo).permit(:description, :shortDesc)
    end 
  end
