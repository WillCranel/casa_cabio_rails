class TransactionsController < ApplicationController

  def index
    @transactions = params[:search] ? Transaction.where(currency: params[:search]) : Transaction.all
    @text = params[:text]
  end
  
	def show
    @t = Transaction.find(params[:id])
  end

  def new
    @t = Transaction.new
  end

  def create
    @t = Transaction.new(transaction_params)
    if @t.save
      redirect_to @t
    else
      render :new
    end
  end

  def edit
    @t = Transaction.find(params[:id])
  end

  def update
    @t = Transaction.find(params[:id])
    if @t.update(transaction_params)
      redirect_to @t
      else
        render :edit
      end
  end

  def destroy
    t = Transaction.find(params[:id])
    t.destroy
    redirect_to action: 'index', text: 'Transação apagada com sucesso!'
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type, :user_id)
  end
end
