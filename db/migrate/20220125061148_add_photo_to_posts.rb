class AddPhotoToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :post_photo, :string, null: true
  end
end
