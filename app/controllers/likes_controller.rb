class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(dream_id: params[:dream_id])  # likesテーブルにcuurent_userのidと投稿記事のidが保存される
    redirect_back(fallback_location: root_path)  # いいねをした元のページに戻る
  end

  def destroy
    @dream = Dream.find(params[:id])  # 選んだ記事を、@dream.idに代入
    @like = current_user.likes.find_by(dream_id: @dream.id)  # ユーザー本人がいいねを押した記事のみ取得する
    @like.destroy
    redirect_back(fallback_location: root_path)  # いいねを取り消した元のページに戻る
  end
end
