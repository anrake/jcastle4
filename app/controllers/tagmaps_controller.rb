class TagmapsController < ApplicationController
  before_action :set_tagmap, only: [:show, :edit, :update, :destroy]

  # GET /tagmaps
  # GET /tagmaps.json
  def index
    @tagmaps = Tagmap.all
  end

  # GET /tagmaps/1
  # GET /tagmaps/1.json
  def show
  end

  # GET /tagmaps/new
  def new
    @tagmap = Tagmap.new
  end

  # GET /tagmaps/1/edit
  def edit
  end

  # POST /tagmaps
  # POST /tagmaps.json
  def create
    @tagmap = Tagmap.new(tagmap_params)

    respond_to do |format|
      if @tagmap.save
        format.html { redirect_to @tagmap, notice: 'Tagmap was successfully created.' }
        format.json { render :show, status: :created, location: @tagmap }
      else
        format.html { render :new }
        format.json { render json: @tagmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tagmaps/1
  # PATCH/PUT /tagmaps/1.json
  def update
    respond_to do |format|
      if @tagmap.update(tagmap_params)
        format.html { redirect_to @tagmap, notice: 'Tagmap was successfully updated.' }
        format.json { render :show, status: :ok, location: @tagmap }
      else
        format.html { render :edit }
        format.json { render json: @tagmap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tagmaps/1
  # DELETE /tagmaps/1.json
  def destroy
    @tagmap.destroy
    respond_to do |format|
      format.html { redirect_to tagmaps_url, notice: 'Tagmap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tagmap
      @tagmap = Tagmap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tagmap_params
      params[:tagmap]
    end
end
