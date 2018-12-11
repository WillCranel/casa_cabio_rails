class ChangeQuotationToBeFloatInTransactions < ActiveRecord::Migration[5.2]
  def change
  	change_column :transactions, :quotation, :float
  end
end
