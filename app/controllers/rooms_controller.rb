class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @rooms= Room.includes(:user).order(:name).all
  end

  def new
    @room= Room.new
  end

  def create
    @room= current_user.rooms.create(room_params)
    redirect_to rooms_path
  end

  def show
    @room= Room.includes(:user, :messages).find(params[:id])
  end

  def edit
    @room = Room.where(user_id: current_user.id).find(params[:id])
  end

  def update
    @room = Room.where(user_id: current_user.id).find(params[:id]).update(room_params)
    redirect_to rooms_path
  end

  private
  def room_params
    params.require(:room).permit(:name, :song_file)
  end
end
