module ApplicationHelper
  def recent_albums
    Song.recent(3)
  end
end
