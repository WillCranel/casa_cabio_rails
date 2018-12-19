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

  def edit
    @t = Transaction.find(params[:id])
    @currencies = { 'Dólar' => 'Dólar', 'Real' => 'Real'}
    @types = { 'Venda' => 'Venda', 'Compra' => 'Compra'}
  end

  def update
    @t = Transaction.find(params[:id])
    if @t.update(transaction_params)
      redirect_to @t
      else
        @currencies = { 'Dólar' => 'Dólar', 'Real' => 'Real'}
        @types = { 'Venda' => 'Venda', 'Compra' => 'Compra'}
        render :edit
      end
  end

  def destroy
    t = Transaction.find(params[:id])
    t.destroy
    redirect_to controller: 'home', action: 'index', text: 'Transação apagada com sucesso!'
  end

  def transaction_params
    params.require(:transaction).permit(:amount, :currency, :quotation, :transaction_type, :user_id)
  end
end
