class Transaction < ApplicationRecord
	belongs_to :user

	validates :amount, :currency, :quotation, :transaction_type, :user, presence: true

	def calculate_total
  	total = currency == 'dollar' || currency == 'Dólar' ? amount : amount / quotation
  	transaction_type == 'sell' || transaction_type == 'Venda' ? -total : total
  end

  def currency_translated
		return 'Dólar' if currency == 'dollar' || currency == 'Dólar'
		'Real'
  end

  def transaction_type_translated
		return 'Venda' if transaction_type == 'sell' || transaction_type == 'Venda'
		'Compra'
  end
end
