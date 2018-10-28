class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "メッセージを投稿しました。"
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = "メッセージの投稿に失敗しました。"
      redirect_back(fallback_location: root_path)
      #redirect_to "circles/show"
    end
  end

  def destroy
  end
  
  private
  def micropost_params
    params.require(:micropost).permit(:content, :circle_id)
  end
end
