# frozen_string_literal: true

class AddIssueColumnToRepresentatives < ActiveRecord::Migration[5.2]
  def change
    add_column :news_items, :issue, :string
  end
end
