class CirclesController < ApplicationController
  before_action :require_user_logged_in
  
  
  def index
  end

  def show
  end

  def new
    
    if logged_in?
      @book = Book.find_or_initialize_by(code: params[:book_code])
      
      unless @book.persisted?
        results = RakutenWebService::Ichiba::Item.search(itemCode: @book.code)
        @book = Book.new(read(results.first))
        @book.save!
      end
      
      @book_circle = current_user.circles.build(book_id: @book.id)
    end 
  end
  
  def create
    @book_circle = current_user.circles.build(new_circle)
    if @book_circle.save
      flash[:success] = "読書会を作成しました。"
      redirect_to root_path
    else
      flash[:danger] = "読書会を作成できませんでした。"
      render :new
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:code, :name, :url, :image_url)
  end
  
  def new_circle
    params.require(:circle).permit(:title, :attend, :online, :online_detail, :offline_detail, :capacity, :minutes, :content, :book_id)
  end
end
