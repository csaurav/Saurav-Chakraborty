class ArtishPic < ActiveRecord::Migration
  def change
    add_column :artists, :profile_pic_url, :string
  end
end
