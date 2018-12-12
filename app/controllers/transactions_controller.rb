class TransactionsController < ApplicationController

	def show
    @t = Transaction.find(params[:id])
  end

  def new
    @t = Transaction.new
    @currencies = { 'Dólar' => 'Dólar', 'Real' => 'Real'}
    @types = { 'Venda' => 'Venda', 'Compra' => 'Compra'}
  end

  def create
    @t = Transaction.new(transaction_params)
    if @t.save
      redirect_to @t
    else
      @currencies = { 'Dólar' => 'Dólar', 'Real' => 'Real'}
    	@types = { 'Venda' => 'Venda', 'Compra' => 'Compra'}
      render :new
    end
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type)
  end
end
