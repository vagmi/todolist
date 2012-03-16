user = User.create(:email=>"test@example.com",:password=>"password")
1.upto(3) do |bucket_number|
  bucket = Bucket.create(:name=>"Bucket #{bucket_number}",:user_id=>user.id)
  1.upto(10) do |item_number|

    bucket.items.create(:content=>"Item number #{item_number}",
                        :status=>(rand(2)==1),
                        :user_id=>user.id)
  end
end
