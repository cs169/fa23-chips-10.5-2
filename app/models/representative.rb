# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all


  def self.find_official(name, title, ocdid, street, city, state, zip, political_party, photo)
    Representative.where('name = ? AND ocdid = ? AND title = ? AND street = ? AND city = ? AND state = ? AND zip = ? AND political_party = ? AND photo = ?', name, ocdid, title, street, city, state, zip, political_party, photo).first
  end

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      ocdid_temp = ''
      title_temp = ''

      rep_info.offices.each do |office|
        if office.official_indices.include? index
          title_temp = office.name
          ocdid_temp = office.division_id
        end
      end

      # iter 1.1 code
      to_add = find_official(official.name, title_temp, ocdid_temp, official.address&.first&.line1, official.address&.first&.city, official.address&.first&.state, official.address&.first&.zip, official.party, official.photo_url)
      if to_add
        reps.push(to_add)
      else
        rep = Representative.create!({
            name: official.name,
            ocdid: ocdid_temp,
            title: title_temp,
            street: official.address&.first&.line1,
            city: official.address&.first&.city,
            state: official.address&.first&.state,
            zip: official.address&.first&.zip,
            political_party: official.party,
            photo: official.photo_url
          })
        reps.push(rep)
      end
    end
    reps
  end
end
