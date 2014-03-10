class AddDisabledToSupportRequest < ActiveRecord::Migration
  def change
    add_column :support_requests, :disabled, :boolean, default: false
  end
end
