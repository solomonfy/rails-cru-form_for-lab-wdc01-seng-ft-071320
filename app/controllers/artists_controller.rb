class ArtistsController < ApplicationController

    before_action :find_artist, only: [:show, :edit, :update, :destroy]

    def index
        @artists = Artist.all
    end

    def show
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(artist_params)
        redirect_to artist_path(@artist)
    end
    
    def edit
    end
    
    def update
        @artist.update(artist_params)
        redirect_to artist_path(@artist)
    end
    
    def destroy
        @artist.delete
        redirect_to artists_path
    end

    private

    def find_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end

end
