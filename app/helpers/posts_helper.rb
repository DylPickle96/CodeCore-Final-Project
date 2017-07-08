module PostsHelper
  def posts_json(posts)
    Gmaps4rails.build_markers(posts) do |post, marker|
      marker.lat        post.latitude
      marker.lng        post.longitude
      marker.infowindow post.model_year.to_s + ' ' + post.make + ' ' + post.model
    end
  end
end
