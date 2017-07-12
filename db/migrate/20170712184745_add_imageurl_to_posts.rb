class AddImageurlToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :imageurl, :string, default: 'placeholder.jpg'
  end
end
