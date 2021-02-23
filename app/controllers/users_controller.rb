class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]  # deviseのメソッド！ログインしていないユーザーはユーザー一覧画面のみアクセス可。

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)        # 更新する中身(カラム)を定義する
      redirect_to user_path(@user)      # 更新できたらユーザー詳細ページに遷移する
    else
      render :edit                      # 更新されなかったら編集ページにとどまる
    end
  end

  private # usersコントローラーのみ以下を実行する事ができる(セキュリティの強化)

  def set_user
    @user = User.find(params[:id])
  end

  # 更新するカラムの中身
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
