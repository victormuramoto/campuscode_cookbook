class KitchensController < ApplicationController
  before_action :set_kitchen, only: [:show]
  before_action :authenticate_admin!, only: [:new, :create]

  def show
  end

  def new
    @kitchen = Kitchen.new
  end

  def create
    @kitchen = Kitchen.create(kitchen_params)
    respond_with @kitchen
  end

  private

  def set_kitchen
    @kitchen = Kitchen.find(params[:id])
  end

  def kitchen_params
    params.require(:kitchen).permit(:name)
  end
end
