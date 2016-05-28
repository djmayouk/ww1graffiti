class PhotosController < ApplicationController
  require 'flickraw'

  before_action :set_photo, only: [:show, :destroy]
  before_action :set_flickr, only: [:create, :destroy]

  def new
  end

  def create
    @graffiti = Graffiti.find(params[:graffiti_id])
#    @photo = @graffiti.photos.create(photo_params)
#    redirect_to edit_graffiti_path(@graffiti)

    photo_id = flickr.upload_photo params[:photo].tempfile.path, :title => "My Title", :description => "My Description"
    photo_url = FlickRaw.url_o(flickr.photos.getInfo(photo_id: photo_id))

    #@photo = Photo.new(photo_id: photo_id, photo_url: photo_url)
    @photo = @graffiti.photos.create(flickr_id: photo_id, link: photo_url)

#    respond_to do |format|
      if @photo.save
        redirect_to edit_graffiti_path(@graffiti)
#        format.html { redirect_to @edit_graffiti_path, notice: ‘Photo was successfully created.’ }
#        format.json { render action: ‘show’, status: :created, location: @photo }
#      else
#        format.html { render action: ‘new’ }
#        format.json { render json: @graffiti.photo.errors, status: :unprocessable_entity }
      end
#    end


  end

  def update
    @graffiti = Graffiti.find(params[:graffiti_id])
    @photo = Photo.find(params[:id])

    if @photo.update(photo_params)
      redirect_to graffiti_show_path(@graffiti)
    else
      render 'edit'
    end
  end

  def destroy
    @graffiti = Graffiti.find(params[:graffiti_id])
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to edit_graffiti_path(@graffiti)
  end
 
  private
    def photo_params
      params.require(:photo).permit(:photo, :link, :caption, :flickr_id)
    end

    def set_photo
      @graffiti = Graffiti.find(params[:graffiti_id])
      @photo = Photo.find(params[:id])
    end

    def set_flickr
      FlickRaw.api_key = ENV['FLICKR_API_KEY']
      FlickRaw.shared_secret = ENV['FLICKR_API_SECRET']

      flickr.access_token = ENV['FLICKR_ACCESS_TOKEN']
      flickr.access_secret = ENV['FLICKR_ACCESS_SECRET']
    end
end
