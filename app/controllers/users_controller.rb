class UsersController < ApplicationController

  def set_apis
    @news = NYTimes.new
    
  end


end
