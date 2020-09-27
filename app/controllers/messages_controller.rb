class MessagesController < ApplicationController
  def index
    @message = Message.new
    #Message.newで生成したMessageモデルのインスタンス情報を代入
    @room = Room.find(params[:room_id])
    #paramsに含まれているroom_idを代入
    @messages = @room.messages.includes(:user)
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    #@room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成
    #message_paramsを引数にしてprivateメソッドを呼び出し
    if @message.save
    #その値を@messageに代入saveメソッドでメッセージの内容をmessagesテーブルに保存
      redirect_to room_messages_path(@room)
      #保存成功で参加しているチャットルームに投稿したメッセージの一覧画面にリダイレクト
    else
      @messages = @room.messages.includes(:user)
      render :index
      #保存できなかった場合indexアクションが実行され同じページに戻る
    end
  end

  

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
    #message_paramsを定義しメッセージの内容(content)をmessagesテーブルへ保存
    #パラメーターの中にログインしているユーザーのidと紐付いているメッセージの内容(content)を受け取れるように許可

  end
end
