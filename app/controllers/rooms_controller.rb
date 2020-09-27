class RoomsController < ApplicationController

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
    #保存の場合ルートパスに遷移 でなければrenderでrooms/new.html.erbへ
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids:[])
    #配列に対して保存を許可したい場合キーの名称と関連づけてバリューに「[]」と記述
  end
end
