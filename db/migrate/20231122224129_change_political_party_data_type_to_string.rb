class ChangePoliticalPartyDataTypeToString < ActiveRecord::Migration[5.2]
  def change
    change_column :representatives, :political_party, :string
  end
end
