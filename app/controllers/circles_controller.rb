class CirclesController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create]
  
  
  def index
  end

  def show
    @circle = Circle.find(params[:id])
    @book = Book.find_by(id: @circle.book_id)
    @capacity = @circle.capacity - @circle.entry_users.count
    #無理ならばMicropost.new(circle_id: @circle.id, user_id: current_user.id)としろ
    @micropost = current_user.microposts.build(circle_id: @circle.id) if current_user
    @microposts = @circle.microposts.order('created_at DESC')
=begin
    attend_number = ["オンライン", "オフライン", "どちらも可"]
    @attend_circle = attend_number[@circle.attend.to_i]
    online_number = ["Skype", "Zoom", "apper.in"]
    @online_circle = online_number[@circle.online.to_i]
=end

    


  end

  def new
    
    if logged_in?
      
      @book = Book.find_or_initialize_by(code: params[:book_code])
      
      unless @book.persisted?
        results = RakutenWebService::Ichiba::Item.search(itemCode: @book.code)
        @book = Book.new(read(results.first))
        @book.save!
      end
      
      @book_circle = current_user.circles.build(book_id: @book.id, user_id: current_user.id)
    end 
  end
  
  def create
    #binding.pry
    @book_circle = Circle.new(new_circle)
    if @book_circle.save
      flash[:success] = "読書会を作成しました。"
      redirect_to @book_circle
    else
      flash[:danger] = "読書会を作成できませんでした。"
      redirect_to new_book_path 
    end
  end
  
  private
  
  def book_params
    params.require(:book).permit(:code, :name, :url, :image_url)
  end
  
  def new_circle
    params.require(:circle).permit(:title, :attend, :online, :online_detail, :offline_detail, :capacity, :minutes, :reserved_at, :content, :book_id, :user_id)
  end
end
