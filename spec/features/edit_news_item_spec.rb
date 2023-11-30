require 'rails_helper'

RSpec.feature 'Edit NewsItem' do
  scenario 'User edits a news item and selects an issue' do
    let(:representative) {Representative.create(id: 100)}
    before do
      representative.save!
    end
    news_item = NewsItem.new(title: "Test Article", link: "https://www.google.com", representative_id: 100, issue: 2)

    # Simulate user actions
    visit edit_representative_news_item_path(representative, news_item)
    select 'Immigration', from: 'news_item_issue' # Replace with your field name
    click_button 'Save'

    # Expectations
    expect(page).to have_content('Immigration')
    # Add more expectations if needed
  end
end