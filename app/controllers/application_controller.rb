class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_search
  
  include SessionsHelper
 
 
  def set_search
    @search = Circle.ransack(params[:q])
    @search_circles = @search.result.order("updated_at DESC")
  end

  
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
    

    
    {
      code: code,
      name: name,
      url: url,
      image_url: image_url
    }
  end
  
end
