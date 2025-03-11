module ServiceDetailsHelper
  def service_detail_content(service_name)
    case service_name.downcase
    when /tıkanıklık/
      tikaniklik_service_details
    when /kaçak/
      kacak_service_details
    when /boya/
      boya_service_details
    else
      default_service_details
    end
  end

  private

 
end
