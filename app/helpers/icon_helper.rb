module IconHelper
  def icon(name, classes = "w-6 h-6")
    render partial: "shared/icons/#{name}", locals: { classes: classes }
  end
end 