# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.civic_api_to_representative_params(rep_info)
    reps = []

    rep_info.officials.each_with_index do |official, index|
      ocdid_temp, title_temp = find_ocdid_and_title(rep_info.offices, index)

      to_add = find_or_create_representative(
        official,
        ocdid_temp,
        title_temp
      )

      reps.push(to_add)
    end

    reps
  end

  def self.find_ocdid_and_title(offices, index)
    title_temp = ''
    ocdid_temp = ''

    offices.each do |office|
      if office.official_indices.include? index
        title_temp = office.name
        ocdid_temp = office.division_id
      end
    end

    [ocdid_temp, title_temp]
  end

  def self.find_or_create_representative(official, ocdid, title)
    existing_rep = find_existing_representative(official, ocdid, title)

    return existing_rep if existing_rep

    create_representative(official, ocdid, title)
  end

  def self.find_existing_representative(official, ocdid, title)
    address = official.address&.first

    Representative.find_by(
      name:            official.name,
      ocdid:           ocdid,
      title:           title,
      street:          address&.line1,
      city:            address&.city,
      state:           address&.state,
      zip:             address&.zip,
      political_party: official.party,
      photo:           official.photo_url
    )
  end

  def self.create_representative(official, ocdid, title)
    address = official.address&.first

    Representative.create!(
      name:            official.name,
      ocdid:           ocdid,
      title:           title,
      street:          address&.line1,
      city:            address&.city,
      state:           address&.state,
      zip:             address&.zip,
      political_party: official.party,
      photo:           official.photo_url
    )
  end
end
