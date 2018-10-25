class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user_logged_in, only: [:show, :keeps, :entries]
  

  
  

  def show
    @created_circle = @user.created_circles
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザを登録しました。"
      redirect_to @user   #あとで読書会一覧ページにリダイレクトするようにURLを変える
    else
      flash.now[:danger] = "ユーザの登録に失敗しました。"
      render :new
    end
  end

  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "ユーザ情報が更新されました"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザ情報が更新されませんでした"
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "退会しました"
    redirect_to root_path
  end
  
  def keeps
    @user = current_user
    @keeps = @user.keep_circles
  end
  
  def entries
    @user = current_user
    @entries = @user.entry_circles
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :content, :image) #,:image_cache
  end
end
