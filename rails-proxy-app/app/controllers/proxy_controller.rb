class ProxyController < ApplicationController
  def fetch_data
    url = params[:url]
    proxy_service = CacheProxyService.new(url)
    render json: proxy_service.fetch
  end
end
