class RenameTransactionParamsToPaypalParams < ActiveRecord::Migration
  def change
    rename_column :support_requests, :transaction_params, :paypal_params
  end
end
