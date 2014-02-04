json.array!(@comments) do |comment|
  json.extract! comment, :id, :support_request_id, :from, :body
  json.url comment_url(comment, format: :json)
end
