# frozen_string_literal: true

class ChangeIssueColumnToInt < ActiveRecord::Migration[5.2]
  def change
    change_column :news_items, :issue, :integer
  end
end
