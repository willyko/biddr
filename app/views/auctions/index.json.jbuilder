json.array!(@auctions) do |auction|
  json.extract! auction, :id, :title, :details, :ends_on, :reserve_price
  json.url auction_url(auction, format: :json)
end
