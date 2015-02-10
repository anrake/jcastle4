class Admin::KokuinsController < ApplicationController
  before_action :set_kokuin, only: [:show, :edit, :update, :destroy]

  # GET /kokuins
  # GET /kokuins.json
  def index
    @kokuins = Kokuin.all
  end

  # GET /kokuins/1
  # GET /kokuins/1.json
  def show
    @kpictures = @kokuin.photos
    @kmatch = KokuinMatch.new
   # @kokuin.photos.build
  end

  # GET /kokuins/new
  def new
    @kokuin = Kokuin.new
  end

  # GET /kokuins/1/edit
  def edit
  end

  # POST /kokuins
  # POST /kokuins.json
  def create
    @kokuin = Kokuin.new(kokuin_params)

    respond_to do |format|
      if @kokuin.save
        format.html { redirect_to admin_kokuin_path(@kokuin), notice: 'Kokuin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @kokuin }
      else
        format.html { render action: 'new' }
        format.json { render json: @kokuin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kokuins/1
  # PATCH/PUT /kokuins/1.json
  def update
    respond_to do |format|
      if @kokuin.update(kokuin_params)
        format.html { redirect_to admin_kokuin_path, notice: 'Kokuin was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @kokuin }
      else
        format.html { render action: 'edit' }
        format.json { render json: @kokuin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kokuins/1
  # DELETE /kokuins/1.json
  def destroy
    @kokuin.destroy
    respond_to do |format|
      format.html { redirect_to admin_kokuins_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kokuin
      @kokuin = Kokuin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kokuin_params
      params.require(:kokuin).permit(:thumbnail, :known_users, :description, :shortDesc, :descJse, :shortDescJse, :ktype, :ktype2, :strokes, photo_ids: [], kokuin_match_ids: [])
    end
end
