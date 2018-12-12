class Transaction < ApplicationRecord
	validates :amount, :currency, :quotation, :transaction_type, presence: true

	def calculate_total
  	operator = transaction_type == 'sell' || transaction_type == 'Venda' ? '-' : ''
  	total = currency == 'dollar' || currency == 'Dólar' ? amount : amount / quotation

  	"$ #{operator}#{sprintf('%.2f', total)}"
  end
end
