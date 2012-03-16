class BucketsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @buckets = current_user.buckets
  end
  def new
    @bucket = current_user.buckets.build
  end
  def create
    @bucket = Bucket.new(params[:bucket])
    @bucket.user = current_user
    if(@bucket.save)
      redirect_to buckets_path, :notice=>"Bucket created successfully"
    else
      render :action=>:new
    end
  end
  def show
    @bucket = Bucket.find(params[:id])
  end
  def edit
    @bucket = Bucket.find(params[:id])
  end
  def update
    @bucket = Bucket.find(params[:id])
    if(@bucket.update_attributes(params[:bucket]))
      redirect_to @bucket, :notice=>"Updated successfully"
    else
      render :action=>:edit
    end
  end
  def destroy
    @bucket = Bucket.find(params[:id])
    @bucket.destroy
    redirect_to buckets_path, :notice=>"Deleted successfully"
  end
end
