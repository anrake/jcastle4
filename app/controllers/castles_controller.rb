class CastlesController < ApplicationController
  before_action :set_castle, only: [:show, :markers]
  after_action :verify_policy_scoped, :only => :index

  # GET /castles
  # GET /castles.json
  def index
#    @castles = Castle.where(approved: '1').order("castle_name_en ASC")
    @castles = policy_scope(Castle)
  end

  # GET /castles/1
  # GET /castles/1.json
  def show
    @cpictures = @castle.photos.order("vieworder ASC")
  end

  def markers
    @mappedpics = @castle.photos.where("plat > 0")
    render :xml => @mappedpics.to_xml
  end

  # GET /castles/new
  #def new
  #  @castle = Castle.new
  #end

  # GET /castles/1/edit
  #def edit
  #end

  # POST /castles
  # POST /castles.json
  #def create
  #  @castle = Castle.new(castle_params)
  #
  #  respond_to do |format|
  #   if @castle.save
  #      format.html { redirect_to @castle, notice: 'Castle was successfully created.' }
  #      format.json { render action: 'show', status: :created, location: @castle }
  #    else
  #      format.html { render action: 'new' }
  #      format.json { render json: @castle.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # PATCH/PUT /castles/1
  # PATCH/PUT /castles/1.json
  #def update
  #  respond_to do |format|
  #    if @castle.update(castle_params)
  #      format.html { redirect_to @castle, notice: 'Castle was successfully updated.' }
  #      format.json { render action: 'show', status: :ok, location: @castle }
  #    else
  #      format.html { render action: 'edit' }
  #      format.json { render json: @castle.errors, status: :unprocessable_entity }
  #    end
  #  end
  #end

  # DELETE /castles/1
  # DELETE /castles/1.json
  #def destroy
  #  @castle.destroy
  #  respond_to do |format|
  #    format.html { redirect_to castles_url }
  #    format.json { head :no_content }
  #  end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_castle
      @castle = Castle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def castle_params
      params.require(:castle).permit(:castle_name_en, :castle_name_ja, photo_attributes: [:description, :shortDesc, :id, :imageable_id, :imageable_type, :_destroy])
    end
end
