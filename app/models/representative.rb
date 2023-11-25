# frozen_string_literal: true

class Representative < ApplicationRecord
  has_many :news_items, dependent: :delete_all

  def self.find_official(name, title, ocdid)
    Representative.where('name = ? AND ocdid = ? AND title = ?', name, ocdid, title).first
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

      # added logic for 1.1
      to_add = find_official(official.name, title_temp, ocdid_temp)
      if to_add
        reps.push(to_add)
      else
        rep = Representative.create!({ name: official.name, ocdid: ocdid_temp,
            title: title_temp })
        reps.push(rep)
      end
    end

    reps
  end
end
