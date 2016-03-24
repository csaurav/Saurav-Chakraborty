class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  before_action :set_profile_pic, only: :show
  respond_to :html

  def set_profile_pic
    return if @artist.profile_pic_url.present?
    url = URI.parse("https://randomuser.me/api/")
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port, use_ssl: url.scheme == 'https') { |http| http.request(req)  }
    thumnail_pic = JSON.parse(res.body)['results'].first["user"]["picture"]["thumbnail"]
    @artist.update_attribute(:profile_pic_url, thumnail_pic.gsub("\"","").strip)
   end


  def index
    @artists = Artist.all
    respond_with(@artists)
  end

  def show
    respond_with(@artist)
  end

  def new
    @artist = Artist.new
    respond_with(@artist)
  end

  def edit
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    respond_with(@artist)
  end

  def update
    @artist.update(artist_params)
    respond_with(@artist)
  end

  def destroy
    @artist.destroy
    respond_with(@artist)
  end

  def newest
    @artist = Artist.order('created_at ASC').last
    render :show  
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name)
    end
end
