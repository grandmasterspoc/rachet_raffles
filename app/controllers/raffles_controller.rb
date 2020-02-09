class RafflesController < ApplicationController

  def new
    @unused_raffles = current_user.raffle_posts.select { |post| Raffle.where(post_id: post["id"]).count < 1 }
  end

  def index
  end
end
