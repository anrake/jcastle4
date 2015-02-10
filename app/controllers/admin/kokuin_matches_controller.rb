class Admin::KokuinMatchesController < ApplicationController
  before_action :set_kokuin_match, only: [:show, :edit, :update, :destroy]

  # GET /kokuin_matches
  # GET /kokuin_matches.json
  def index
    @kokuin_matches = KokuinMatch.all
  end

  # GET /kokuin_matches/1
  # GET /kokuin_matches/1.json
  def show
  end

  # GET /kokuin_matches/new
  def new
    @kokuin_match = KokuinMatch.new
  end

  # GET /kokuin_matches/1/edit
  def edit
  end

  # POST /kokuin_matches
  # POST /kokuin_matches.json
  def create
    @kokuin_match = KokuinMatch.new(kokuin_match_params)

    respond_to do |format|
      if @kokuin_match.save
        format.html { redirect_to (admin_kokuin_url @kokuin_match.kokuin_id), notice: 'Kokuin match was successfully updated.' }
        format.json { render :show, status: :created, location: @kokuin_match }
      else
        format.html { render :new }
        format.json { render json: @kokuin_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kokuin_matches/1
  # PATCH/PUT /kokuin_matches/1.json
  def update
    respond_to do |format|
      if @kokuin_match.update(kokuin_match_params)
        format.html { redirect_to @kokuin_match, notice: 'Kokuin match was successfully updated.' }
        format.json { render :show, status: :ok, location: @kokuin_match }
      else
        format.html { render :edit }
        format.json { render json: @kokuin_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kokuin_matches/1
  # DELETE /kokuin_matches/1.json
  def destroy
    @kokuin_match.destroy
    respond_to do |format|
      format.html { redirect_to kokuin_matches_url, notice: 'Kokuin match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kokuin_match
      @kokuin_match = KokuinMatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kokuin_match_params
      params.require(:kokuin_match).permit(:kokuin_id, :photo_id, :combination)
    end
end
