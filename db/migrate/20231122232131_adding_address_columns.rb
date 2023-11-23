class AddingAddressColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :representatives, :street, :string
    add_column :representatives, :city, :string
    add_column :representatives, :state, :string
    add_column :representatives, :zip, :string
    remove_column :representatives, :contact_address, :json
  end
end
