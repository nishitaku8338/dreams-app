class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]  # deviseのメソッド！未登録ユーザーは投稿一覧画面と投稿詳細画面のみアクセスできる
  before_action :set_user, except: [:index, :new, :create]    # 単一レコードを取得する

  def index
    @users = User.all
  end

  def show
  end

  def edit
    redirect_to users_path, alert: '不正なアクセスです。' if @user != current_user # ユーザー本人のみプロフィールの編集ができる(URL直入力制限)
  end

  def update
    if @user.update(user_params)        # 更新する中身(カラム)を定義する
      redirect_to user_path(@user)      # 更新できたらユーザー詳細ページに遷移する
    else
      render :edit                      # 更新されなかったら編集ページにとどまる
    end
  end

  private # usersコントローラーのみ以下を実行する事ができる(セキュリティの強化)

  # 単一レコードを取得する
  def set_user
    @user = User.find(params[:id])
  end

  # 更新するカラムの中身
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
