class CirclesUsersController < ApplicationController
  def create
    @circle = Circle.find(params[:circle_id])
    if params[:type] == "Keep"
      current_user.keep(@circle)
      flash[:success] = "キープに成功しました。"
      redirect_back(fallback_location: root_path)
    end
    
    if params[:type] == "Entry"
      current_user.entry(@circle)
      flash[:success] = "参加登録しました"
      redirect_to @circle
    end
    
    
      
  end

  def destroy
    @circle = Circle.find(params[:circle_id])
    if params[:type] == "Keep"
      current_user.unkeep(@circle)
      flash[:success] = "キープを解除しました。"
      redirect_back(fallback_location: root_path)
    end
    
    if params[:type] == "Entry"
      current_user.unentry(@circle)
      flash[:success] = "参加を取り消しました"
      redirect_to entries_user_path(current_user)
    end
  end
end
