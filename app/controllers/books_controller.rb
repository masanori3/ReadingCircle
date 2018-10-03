class BooksController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    
    @books = []
    
    @keyword = params[:keyword]
    if @keyword.present?
      results = RakutenWebService::Ichiba::Item.search({
        keyword: @keyword,
        genreId: 200162,
        hits: 20
      })
        
      results.each do |result|
        book = Book.find_or_initialize_by(read(result))
        @books << book
      end
    end
  end  
  
  
  #以下、ex.2によりいらないアクションとなった。
  def create
    @book = Book.find_or_initialize_by(code: params[:item_code])
    
    #item_codeはパーシャルで作るボタンにおけるhidden_field_tagを通じて実質item.codeの情報が代入されている
    #詳しくは右記画像URL（https://techacademy.jp/my/rails/monolist#chapter-10-3）の_want_button.html.erbを見ろ。
    
    unless @book.persisted?
      results = RakutenWebService::Ichiba::Item.search(itemCode: @book.code)
      
      @book = Book.new(read(results.first))
      @book.save
      
    end
    
    redirect_to new_circle_path
  end
  
  
  
  
 
  
  
  
end
