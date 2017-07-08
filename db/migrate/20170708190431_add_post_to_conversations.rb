class AddPostToConversations < ActiveRecord::Migration[5.1]
  def change
    add_reference :conversations, :post, foreign_key: true
  end
end
