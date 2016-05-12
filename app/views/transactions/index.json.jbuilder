json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :user, :stock, :kind
  json.url transaction_url(transaction, format: :json)
end
