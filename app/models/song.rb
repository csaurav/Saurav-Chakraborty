class Song < ActiveRecord::Base
  belongs_to :album
  belongs_to :artist
  
  validates :name, presence: true, length: { in: 5..50 }
  validates :album_id, :artist_id, presence: true

  # I think requirement should have been to create 
  # a scope in the album model instead of Song model
  
  scope :recent, -> (n) { Album.records(9.months.ago).
                          limit(n).
                          order('created_at DESC')
                        }
end
