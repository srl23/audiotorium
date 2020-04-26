class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @rooms=Room.includes(:user).order(:name).all
  end

  def new
    @room=Room.new
  end

  def create
    @room=current_user.rooms.create(room_params)
  end

  def show
    @room=Room.includes(:user, :messages).find(params[:id])
  end

  private
  def room_params
    params.require(:room).permit(:name)
  end
end
