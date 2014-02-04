class AddTokenToSupportRequests < ActiveRecord::Migration
  def change
    add_column :support_requests, :token, :string
  end
end
