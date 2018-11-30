class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.save
    redirect_to song_path(@song)
  end

  def show

    @song = Song.find(params[:id])
    @artist = Artist.find(@song.artist_id)
    @genre = Genre.find(@song.genre_id)



  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to @song
  end

  private

    def song_params
      params.require(:song).permit(:name, :artist, :genre)
    end

end


#
# {"utf8"=>"✓",
#  "authenticity_token"=>
#   "7SaXwBvbHS2tL7nefaLfmQa3lGrPXkRvlIRWj4Uq9iB09aYpumdx8b2j6gbWZBVUb6sP9aNVzdWulGaxrEiFNw==",
#  "song"=>{"name"=>"song5", "artist_id"=>"artist5", "genre_id"=>"genre5"},
#  "commit"=>"Create Song",
#  "controller"=>"songs",
#  "action"=>"create"}
