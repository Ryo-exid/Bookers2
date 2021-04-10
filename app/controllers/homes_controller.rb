class HomesController < ApplicationController
  def top
  end
  
  def index
    redirect_to :action => 'about'
  end
  
  def about
  end
end
