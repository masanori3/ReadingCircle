class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  
  def index
  end

  def show
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save!
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
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :content, :image) #,:image_cache
  end
end
