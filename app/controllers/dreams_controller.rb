class DreamsController < ApplicationController
  def index
  end

  def new
    @dream = Dream.new  # オブジェクトを生成
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
    @dream = Dream.find(params[:id])
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  def update
    @dream = Dream.find(params[:id])
    if @dream.update(dream_params)        # 更新する中身(カラム)を定義する
      redirect_to dream_path(@dream)      # 更新できたら投稿詳細ページに遷移する
    else
      render :edit                        # 更新されなかったら投稿編集ページにとどまる
    end
  end

  private  # dreamsコントローラーの中でしか呼び出せない(セキュリティ強化)
  
  def dream_params  # new.html.erbのフォームから送信されたカラムの内容を受け取る
    params.require(:dream).permit(:title, :body, :image).merge(user_id: current_user.id)
  end
end
