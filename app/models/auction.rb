class Auction < ActiveRecord::Base

 # include AASM

  belongs_to :user
  has_many :bids, dependent: :destroy

 # aasm whiny_transitions: false do
 #   state :published, initial: true
 #   state :reserve_met
 #   state :won
 #   state :cancelled
 #   state :reserve_not_met

 #   event :reserve do
 #     transitions :from: :published, :to: :reserve_met
 #   end

 # end

  def current_bid
    if bids.count == 0
      return 0
    else
      bids.order(bid_price: :desc).first.bid_price
    end
  end


end
