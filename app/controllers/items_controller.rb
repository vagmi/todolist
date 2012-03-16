class ItemsController < ApplicationController
  def index
    @bucket = Bucket.find(params[:bucket_id])
    @items = @bucket.items
  end
end
