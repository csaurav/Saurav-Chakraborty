module ArtistsHelper

  def profile_pic_present?(artist)
    artist.profile_pic_url.present? ? artist.profile_pic_url : "#"
  end
end
