class CommentsController < ApplicationController
    before_action :authenticate_user!

  def create
    item = Item.find(params[:item_id])
    comment = item.comments.build(comment_params) #buildを使い、contentとitem_idの二つを同時に代入
    comment.user_id = current_user.id
    if comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: item_comments_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: item_comments_path)
    end
  end

  def destroy
    current_user.comments.find_by(item_id: params[:item_id]).destroy!
    flash[:alert] = '削除しました'
    redirect_back(fallback_location: item_comment_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
