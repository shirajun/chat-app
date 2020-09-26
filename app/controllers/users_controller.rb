class UsersController < ApplicationController

  def edit
    #ユーザー編集の為のビューファイル呼び出しのみ
  end

  def update
    if current_user.update(user_params)
    #↑↑ユーザー情報が格納されているcurrent_userメソッドを使用してログインしているユーザーの情報を更新
      redirect_to root_path
      #更新成功の場合チャット画面へリダイレクト 
    else
      render :edit
      #そうでない場合renderメソッドでeditのアクションを指定しているためeditのビュー表示
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
    #↑↑ストロングパラメーター permitメソッドによりnameとemailの編集を許可
  end
end

