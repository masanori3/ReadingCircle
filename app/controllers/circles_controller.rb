class CirclesController < ApplicationController
  before_action :require_user_logged_in, only: [:new]
  
  
  def index
  end

  def show
  end

  def new
    
    if logged_in?
      #ex.2 @circle = current_user.circles.build(book_params)↓
      
      
      
      #ex.1 book_controllerでbooksテーブルに保存するものをcircles_controllerでbooksテーブルに保存。
      #その後、そのデータをcircles#newで使う。↓
      #このやり方でよさそうだ。
      #あとでcirclesテーブルに追加で作ったカラムを消去する。
      
      
      
      #find_or_initialize_by
      #item_codeはパーシャルで作るボタンにおけるhidden_field_tagを通じて実質item.codeの情報が代入されている
      #詳しくは右記画像URL（https://techacademy.jp/my/rails/monolist#chapter-10-3）の_want_button.html.erbを見ろ。
      @book = Book.new(code: params[:book_code])
      
      
      unless @book.persisted?
        results = RakutenWebService::Ichiba::Item.search(itemCode: @book.code)
        
        @book = Book.new(read(results.first))
        @book.save
        
      end
      
      #@book = Book.find_by(code: params[:book_code])
      
      #以下、インスタンスの作成によるBookとCircleの1対多の実現。よって、インスタンスはなにも情報がない。（book_idのみ）
      #したがって、読書会で使う本の画像や名前などを表示させたいならば、@bookをつかう。
      @book_circle = @book.circles.build
    
      
    end 
      
      
      
      #@circle_book.nameやurl、url_imageとしてデータを取得する
    
    
  end
  
  def create
  end
  
  private
  
  def book_params
    
    params.require(:book).permit(:code, :name, :url, :image_url)
    
  end
    
end
