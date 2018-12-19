class Transaction < ApplicationRecord
	belongs_to :user

	validates :amount, :currency, :quotation, :transaction_type, :user, presence: true

	def calculate_total
  	total = currency == 'dollar' || currency == 'Dólar' ? amount : amount / quotation
  	transaction_type == 'sell' || transaction_type == 'Venda' ? -total : total
  end
end
