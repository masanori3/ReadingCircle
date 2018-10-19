class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  #include BooksHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def read(result)
    
    
    
    code = result['itemCode']
    name = result["itemName"]
    url = result["itemUrl"]
    image_url = result["mediumImageUrls"].first["imageUrl"].gsub("?_ex=128x128", "") #unless url_request(image_url)
    
    #imageUrlが無効なものは飛ばすようにしたい（
    #以下、imageUrlが無効だからダメ？
    #Book Load (0.2ms)  SELECT  `books`.* FROM `books` WHERE `books`.`code` = 'bookoffonline:10492405' AND `books`.`name` = '【中古】 一家ランラン 幻冬舎文庫／山田邦子(著者) 【中古】afb' AND `books`.`url` = 'http://item.rakuten.co.jp/bookoffonline/0012433160/' AND `books`.`image_url` = 'http://thtumbnail.image.rakuten.co.jp/@0_mall/bookoffonline/cabinet/1849/0012433160l.jpg' LIMIT 1
    #http://thtumbnail.image.rakuten.co.jp/@0_mall/bookoffonline/cabinet/1849/0012433160l.jpg)
    
    {
      code: code,
      name: name,
      url: url,
      image_url: image_url
    }
  end
  
end
