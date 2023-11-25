# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Representative do
  it 'only adds representatives once to the site' do
    existing_rep = described_class.create(name: 'Anvi Kunta', ocdid: '1234', title: 'Supreme Leader')
    reps = described_class.civic_api_to_representative_params(build_rep_info_with_existing_rep)
    expect(reps.length).to eq(1)
    expect(reps.first.id).to eq(existing_rep.id)
  end

  private

  def build_rep_info_with_existing_rep
    rep_info = OpenStruct.new
    rep_info.officials = [OpenStruct.new(name: 'Anvi Kunta')]
    rep_info.offices = [OpenStruct.new(name: 'Supreme Leader', division_id: '1234', official_indices: [0])]
    rep_info
  end
end
