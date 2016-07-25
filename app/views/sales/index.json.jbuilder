json.array!(@sales) do |sale|
  json.extract! sale, :id, :value, :product_id, :client_id, :installments
  json.url sale_url(sale, format: :json)
end
