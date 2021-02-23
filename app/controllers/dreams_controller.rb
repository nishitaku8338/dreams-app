class DreamsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]            # deviseのメソッド！未登録ユーザーは投稿一覧画面と投稿詳細画面のみアクセスできる
  before_action :set_dream, except: [:index, :new, :create]             # 単一レコードを取得する
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]  # ユーザー本人のみ投稿内容の編集・削除ができる(URL直入力制限)

  def index
    @dreams = Dream.includes(:user)    # userを紐付け(N+1問題解決)
  end

  def new
    @dream = Dream.new                 # オブジェクトを生成
  end

  def create
    @dream = Dream.new(dream_params)   # ストロングパラメーターに引き渡す
    if @dream.save                     # 投稿を保存する
      redirect_to dream_path(@dream)   # 保存できたら詳細ページに遷移する
    else
      render :new                      # 保存できなかったら投稿ページにとどまる
    end
  end

  def show
  end

  def edit
  end

  def update
    if @dream.update(dream_params)     # 更新する中身(カラム)をストロングパラメーターに引き渡す
      redirect_to dream_path(@dream)   # 更新できたら投稿詳細ページに遷移する
    else
      render :edit                     # 更新されなかったら投稿編集ページにとどまる
    end
  end

  def destroy
    @dream.destroy
    redirect_to dreams_path            # 投稿一覧ページに遷移する
  end

  private  # dreamsコントローラーの中でしか呼び出せない(セキュリティ強化)
  
  def dream_params  # new.html.erbのフォームから送信されたカラムの内容を受け取る(ストロングパラメーター)
    params.require(:dream).permit(:title, :body, :image).merge(user_id: current_user.id)
  end

  def set_dream  # 単一レコードを取得
    @dream = Dream.find(params[:id])
  end

  def ensure_correct_user  # ユーザー本人のみ投稿内容の編集・削除ができる(URL直入力制限)
    if @dream.user != current_user
      redirect_to dreams_path, alert: '不正なアクセスです。'
    end
  end
end
