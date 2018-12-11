class TransactionsController < ApplicationController
	def show
    @t = Transaction.find(params[:id])
  end
end
