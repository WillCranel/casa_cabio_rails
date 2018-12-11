class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
    	t.integer :amount
    	t.string :currency
    	t.integer :quotation
    	t.string :transaction_type

      t.timestamps
    end
  end
end
