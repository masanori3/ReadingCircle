module BooksHelper
=begin
  def url_request(url, limit = 10)
    if limit == 0
      return false
    end
    begin
      response = Net::HTTP.get_response(URI.parse(url))
    rescue
      return false
    else
      case response
      when Net::HTTPSuccess
        return true
      when Net::HTTPRedirection
        url_request(response['location'], limit - 1)
      else
        return false
      end
    end
  end
=end
end

