 require 'giphy'
 # require 'open-uri'   

class GiphyItem < ActiveRecord::Base
  belongs_to :collection

  def api_call
    gif = Giphy.random('happy birthday')
    gif.image_mp4_url.to_s
  end
end
