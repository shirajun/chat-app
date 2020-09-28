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

    def destroy
      room = Room.find(params[:id])
      #削除するだけなのでビューの表示は不要故にインスタンス変数ではなく変数としてroomを定義,destroyメソッドを使用
      room.destroy
      redirect_to root_path
      #削除実行後root(roomsのindex)にリダイレクトする記述
    end

  private

  def room_params
    params.require(:room).permit(:name, user_ids:[])
    #配列に対して保存を許可したい場合キーの名称と関連づけてバリューに「[]」と記述
  end
end
