class ArtworksController < ApplicationController
  def index
    artworks_made = User.find(params[:user_id]).artworks
    artworks_shared = User.find(params[:user_id]).artwork_shares
    total_artworks = []
    artworks_made.each {|artwork_made| total_artworks.push(artwork_made)}
    artworks_shared.each {|artwork_shared| total_artworks.push(artwork_shared)}
    render json: total_artworks
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save!
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    render json: artwork
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork #updated artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end 
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  private
  
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end