module ApplicationHelper
  def toggle_order(order_direction)
    order_direction == "asc" ? "desc" : "asc"
  end

  def doses_link(caption, sort_by = nil)
    sort_by ||= caption.downcase
    default_order_by = 'asc'
    # Personal preference, but when lines start getting longlike this I'd break it into a series of if/else
    order_by = params[:sort_by]==sort_by ? toggle_order(params[:order_by]) : default_order_by
    link_to caption, doses_path(:sort_by => sort_by, :order_by => order_by)
  end

  def animal_doses_link(caption, sort_by = nil)
    sort_by ||= caption.downcase
    default_order_by = 'asc'
    order_by = params[:sort_by]==sort_by ? toggle_order(params[:order_by]) : default_order_by
    link_to caption, animal_path(@animal, :sort_by => sort_by, :order_by => order_by)
  end
end

# TODO: combine above two helper methods
# Good idea! Sounds like a fun challenge.
