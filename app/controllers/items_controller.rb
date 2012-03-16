class ItemsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @bucket = Bucket.find(params[:bucket_id])
    @items = @bucket.items
  end
  def pending
    @bucket = Bucket.find(params[:bucket_id])
    @items = @bucket.items.where("status=? or status is null",false)
    render :action=>:index
  end
  def completed
    @bucket = Bucket.find(params[:bucket_id])
    @items = @bucket.items.where(:status=>true)
    render :action=>:index
  end
  def new
    @bucket = Bucket.find(params[:bucket_id])
    @item = @bucket.items.build
  end
  def create
    @bucket = Bucket.find(params[:bucket_id])
    @item = @bucket.items.build(params[:item])
    if(@item.save)
      redirect_to bucket_items_path(@bucket), :notice=>"Item added successfully"
    else
      render :action=>:new
    end
  end
  def edit
    @item = Item.find(params[:id])
    @bucket = @item.bucket
  end
  def update
    @item = Item.find(params[:id])
    @bucket = @item.bucket
    if(@item.update_attributes(params[:item]))
      redirect_to bucket_items_path(@bucket), :notice=>"Item updated successfully"
    else
      render :action=>:edit
    end
  end
  def destroy
    @item = Item.find(params[:id])
    @bucket = @item.bucket
    @item.destroy
    redirect_to bucket_items_path(@bucket), :notice=>"Item deleted successfully"
  end
  def complete
    @item = Item.find(params[:id])
    @item.complete
    redirect_to bucket_items_path(@item.bucket), :notice=>"Item completed successfully"
  end
end
