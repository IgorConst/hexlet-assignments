class BulletinsController < ApplicationController
  # BEGIN
  def index
    @bulletins = Bulletin.all
  end

  def show
    # @bulletin = Bulletin.find_by(id: params[:id])
    @bulletin = Bulletin.find(params[:id])
    # @bulletin = Bulletin.find(params)
  end
  # END
end
