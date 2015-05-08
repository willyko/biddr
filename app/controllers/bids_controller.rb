class BidsController < ApplicationController
  def create
    @auction = Auction.find params[:auction_id]
    @bid = @auction.bids.new(bid_params)
    @bid.user = current_user
    if @auction.user == current_user
      redirect_to "/auctions/#{@auction.id}", alert: "Cannot bid on own post"
    end
    if @auction.current_bid <= @bid.bid_price
      @bid.save
      redirect_to "/auctions/#{@auction.id}", notice: "Bid successful"
    else
      redirect_to "/auctions/#{@auction.id}", alert: "Invalid amount"
    end
  end

  def show
    @bids = Bid.where(user_id: current_user.id)
  end

  def destroy
  end

  private
  def bid_params
    params.require(:bid).permit(:bid_price)
  end
end
