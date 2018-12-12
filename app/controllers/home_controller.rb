class HomeController < ApplicationController
	
	def index
    @transactions = Transaction.all
    @text = params[:text]
  end
end
