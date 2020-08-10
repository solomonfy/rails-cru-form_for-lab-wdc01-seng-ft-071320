class SongsController < ApplicationController
    
    before_action :find_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
    end

    def show
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(song_params(:name, :artist_id, :genre_id))
        # redirect_to song_path(@song)
        redirect_to artist_path(@song.artist_id)
    end

    def edit
    end

    def update
        @song.update(song_params(:name))
        redirect_to song_path(@song)
    end

    def destroy
        @song.delete
        redirect_to songs_path
    end

    private

    def find_song
        @song = Song.find(params[:id])
    end

    def song_params(*optional)
        params.require(:song).permit(*optional)
    end

end
