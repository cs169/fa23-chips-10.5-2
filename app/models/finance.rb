# frozen_string_literal: true

class Finance < ApplicationRecord
  def self.get_candidates(data)
    Rails.logger.debug 'HERERERERRERRRERERERERE'
    data['results'].map do |candidate|
      state_code = if candidate['state']
                     parts = candidate['state'].split('/')
                     file_name = parts.last || ''
                     file_name.split('.').first
                   end

      {
        name:  reformat_name(candidate['name']),
        party: candidate['party'],
        state: state_code
      }
    end
  end

  def self.reformat_name(name)
    return name unless name.include?(',')

    if name.include?('/')
      name.split(' / ').map { |n| reformat_individual_name(n) }.join(' / ')
    else
      reformat_individual_name(name)
    end
  end

  def self.reformat_individual_name(individual_name)
    parts = individual_name.split(', ')
    return individual_name if parts.length < 2

    last_name = parts[0]
    first_part = parts[1]

    # Split the first part into first name and initial (if present)
    first_name_parts = first_part.split
    first_name = first_name_parts[0]
    initial = first_name_parts.length > 1 ? " #{first_name_parts[1]}" : ''

    "#{first_name}#{initial} #{last_name}".strip
  end
end
