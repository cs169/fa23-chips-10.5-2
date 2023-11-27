# frozen_string_literal: true

class ChangePhotoDataType < ActiveRecord::Migration[5.2]
  def change
    add_column :representatives, :photo, :string
  end
end
