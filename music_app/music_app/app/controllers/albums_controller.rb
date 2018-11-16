class AlbumsController < ApplicationController
  def new
    @album = Album.new
    @band = Band.find(params[:band_id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = [@album.errors.full_messages]
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
  end

  private
  def album_params
    params.require(:album).permit(:title, :year, :studio, :band_id)
  end
end
