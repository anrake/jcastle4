class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy, :top100, :uservisit, :news]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @castles = @page.castles.order('castle_name_en')
  end

  def news
    @castles = @page.castles.order('castle_name_en')
    @types = Page.page_types
  end

  def newsindex
    @pages = Page.news.all
  end


  def top100      
    @castles = @page.castles.where(top_100: 'listed')
  end 

  def uservisit
    @page = Page.find(params[:id])
    @castle = Castle.where(castle_name_en: params[:page][:castle_lookup]).first
    if @page.castles.exists?(@castle)
      redirect_to @page, alert: "already added !!"
    else
      @page.castles << @castle
      redirect_to @page, notice: "You added #{@castle.castle_name_en}."
    end
  end

  def remove_castle
    @page = Page.find(params[:id])
    @castle = Castle.find(params[:castleid])
    @page.castles.delete(@castle)
    redirect_to :back, notice: "You deleted #{@castle.castle_name_en}."
  end


  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)
    @page.user_id = current_user.id
    @page.page_type = "UserPage"

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:user_id, :title, :content, :short_desc, :comment_pref, :rating_pref)
    end
end
