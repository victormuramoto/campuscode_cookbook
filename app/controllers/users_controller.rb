class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :set_kitchens, only: [:show]


  def show
  end


  private

  def set_kitchens
    @user_kitchens =  KitchensUser.all.where("user_id = #{params[:id]}")
    @kitchens = []
    if @user_kitchens != []
      @user_kitchens.each do |k|
        @kitchens  << Kitchen.find(k.kitchen_id)
      end
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

end
