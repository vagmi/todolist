module ItemsHelper
  def complete_class(item)
    'completed' if item.status
  end
end
