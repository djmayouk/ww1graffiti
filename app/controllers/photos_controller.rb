class PhotosController < ApplicationController
  def new
  end

  def create
    @graffiti = Graffiti.find(params[:graffiti_id])
    @photo = @graffiti.photos.create(photo_params)
    redirect_to graffiti_path(@graffiti)
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
      params.require(:photo).permit(:photo, :link)
    end
end
