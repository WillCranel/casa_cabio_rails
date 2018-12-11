class Transaction < ApplicationRecord

	def calculate_total
  	operator = transaction_type == 'sell' ? '-' : ''
  	total = currency == 'dollar' ? amount.to_f : amount.to_f / quotation

  	"$ #{operator}#{sprintf('%.2f', total)}"
  end
end
