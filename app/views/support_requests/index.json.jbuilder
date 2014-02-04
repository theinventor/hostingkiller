json.array!(@support_requests) do |support_request|
  json.extract! support_request, :id, :domain, :customer_email, :name, :phone, :want_to_cancel, :balance_due, :paid, :transaction_params, :registrar, :whois, :ip_address, :cpanel_user, :notes
  json.url support_request_url(support_request, format: :json)
end
