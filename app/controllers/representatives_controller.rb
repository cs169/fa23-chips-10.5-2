# frozen_string_literal: true

class RepresentativesController < ApplicationController
  before_action :set_representative, only: [:show]

  def index
    @representatives = Representative.all
  end
  def show
    @rep
  end
  def set_representative
    @rep = Representative.find(params[:id])
  end

  def representative_params
    params.require(:representative).permit(:name, :ocdid, :title, :political_party, :street, :city, :state, :zip, :photo)
  end

end
