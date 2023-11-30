# frozen_string_literal: true

class Finance < ApplicationRecord
  def self.get_candidates(data)
    puts "HERERERERRERRRERERERERE"
    data['results'].map do |candidate|
      state_code = if candidate['state']
                    parts = candidate['state'].split('/')
                    file_name = parts.last || ""
                    file_name.split('.').first
                    end

      {
      name: reformat_name(candidate['name']),
      party: candidate['party'],
      state: state_code
      }
    end
  end

  private 
  
  def self.reformat_name(name)
    return name unless name.include?(',')

    last_name, first_part = name.split(', ')
    first_name, initial = first_part.split(' ', 2)
    "#{first_name} #{initial} #{last_name}"
  end
end