class ChangePhotoDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :representatives, :photo, :string
  end
end
