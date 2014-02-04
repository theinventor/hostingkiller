class CreateSupportRequests < ActiveRecord::Migration
  def change
    create_table :support_requests do |t|
      t.string :domain
      t.string :customer_email
      t.string :name
      t.string :phone
      t.boolean :want_to_cancel
      t.string :balance_due
      t.boolean :paid
      t.text :transaction_params
      t.string :registrar
      t.text :whois
      t.string :ip_address
      t.string :cpanel_user
      t.text :notes

      t.timestamps
    end
  end
end
