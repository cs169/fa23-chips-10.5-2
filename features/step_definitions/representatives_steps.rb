# frozen_string_literal: true
# Given('there is a representative in the database') do |table|
#   # Extract data from the Cucumber table
#   data = table.hashes.first

#   # Create a Representative record in the database
#   Representative.create!(
#       name: data['name'],
#       title: data['title'],
#       address: JSON.parse(data['address']),
#       photo: JSON.parse(data['photo']),
#       party: data['party'],
#   )
# end

# When('I visit the representatives search page') do
#   visit representatives_search_path
# end

# Then('I should see a table of representatives') do
#   expect(page).to have_selector('table#events tbody tr', count: Representative.count)
# end

# Then('each representative should have a link to their profile') do
#   Representative.all.each do |rep|
#     expect(page).to have_link(rep.name, href: representative_path(rep.id))
#   end
# end

# Then('each representative should have a link to their news articles') do
#   Representative.all.each do |rep|
#     expect(page).to have_link('News Articles', href: representative_news_items_path(rep.id))
#   end
# end
