class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)        # 更新する中身(カラム)を定義する
      redirect_to user_path(@user)      # 更新できたらユーザー詳細ページに遷移する
    else
      render :edit                      # 更新されなかったら編集ページにとどまる
    end
  end

  private  # usersコントローラーのみ以下を実行する事ができる(セキュリティの強化)

  def user_params  # 更新するカラムの中身
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
