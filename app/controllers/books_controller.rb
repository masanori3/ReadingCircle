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
        book = Book.new(read(result))
        @books << book
      end
    end
  end  
  
  private
    
  def read(result)
    code = result['itemCode']
    name = result["itemName"]
    url = result["itemUrl"]
    image_url = result["mediumImageUrls"].first["imageUrl"].gsub("?_ex=128x128", "")
    
    {
      code: code,
      name: name,
      url: url,
      image_url: image_url
    }
  end
 
end
