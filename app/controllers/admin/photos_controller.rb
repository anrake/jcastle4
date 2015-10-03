class Admin::PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

#  before_action :load_imageable

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.order("id DESC").page(params[:page]).per(25)
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
    if @photo.tags
      @photo.tags.build
    else
      5.times {@photo.tags.build}
    end
  end

  # POST /photos
  # POST /photos.json
  def create
    load_imageable
    @photo = Photo.new(photo_params)
    @imageable.photos << @photo

    respond_to do |format|
      if @photo.save
        format.html { redirect_to polymorphic_path([:admin, @imageable]), notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @photo }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to admin_photos_url }
      format.json { head :no_content }
    end
  end

  def add_many
    @castle = Castle.find(params[:castle_id])
    @photonum = params[:photonum]
    @shortname = params[:shortname]
    @photonum.to_i.times do |i|
      k = i + 1
      @photo = Photo.create(
       "imageable_id" => @castle.id,
        "imageable_type" => 'Castle',
        "vieworder" => k,
        "fullpicture" => @shortname + "/" + @shortname + k.to_s + ".jpg",
        "thumbnail" => @shortname + "/" + @shortname + k.to_s + "-t.jpg",
        "highlightPict" => @shortname + "/" + @shortname + k.to_s + "-h.jpg"
        )
    end
    respond_to do |format|
      if @photo.save
        format.html { redirect_to (admin_castle_url @castle), notice: @photonum + 'Photos were successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
#      else
#        format.html { render action: 'new' }
#        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def bulkupdate
    @castle = Castle.find(params[:id])
    @images = @castle.photos.order("vieworder asc")
  end 

  def bulkupdatesave
      @castle = Castle.find(params[:id])
      result = Photo.update(params[:images].keys, params[:images].values).reject { |p| p.errors.empty? }
      if result.empty?
        redirect_to (admin_castle_url @castle), notice: 'Photos were successfully created.'
      else
        image_ids = result.collect {|i| i.id}
        flash[:error] = "Error(s) occurred updating image(s): #{image_ids.join ', '}"
        redirect_to admin_images_bulk_update_path(:page => params[:page])
      end

  end

  private
    def load_imageable
      if params[:castle_id]
        @imageable = Castle.find(params[:castle_id])
      elsif params[:resource_id]
        @imageable = Resource.find(params[:resource_id])
      elsif params[:photo][:castle_id]
        @imageable = Castle.find(params[:photo][:castle_id])
      elsif params[:photo][:resource_id]
        @imageable = Resource.find(params[:photo][:resource_id])
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:description, :shortDesc, :castle_id, :fullpicture, :vieworder, :descJse, :shortDescJse, :hide_profile, :donatedBy, :donatedByLink, tags_attributes: [:id, :tag_name, :tag_group, :description, :sub_tag, :photo_id, :_destroy])
    end
end
