class Transaction < ApplicationRecord

	def calculate_total
  	operator = transaction_type == 'sell' ? '-' : ''
  	total = currency == 'dollar' ? amount : amount / quotation

  	"$ #{operator}#{sprintf('%.2f', total)}"
  end
end
