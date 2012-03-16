class ItemMailer < ActionMailer::Base
  default from: "fidelity.railspundit@gmail.com"

  def on_complete(item)
    @item = item
    mail(:to=>item.user.email,:subject=>"Item completed").deliver!
  end
end
