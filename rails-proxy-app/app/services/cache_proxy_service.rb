require 'faraday'

class CacheProxyService
  CACHE_EXPIRY = 1.hour

  def initialize(url)
    @url = url
  end

  def fetch
    cached_response = Rails.cache.read(cache_key)

    if cached_response
      cached_response
    else
      response = Faraday.get(@url)
      begin
        Rails.cache.write(cache_key, response.body, expires_in: CACHE_EXPIRY)
        puts "Cache guardado correctamente"
      rescue => e
        puts "Error al guardar en el cache: #{e.message}"
      end
      response.body
    end
  end

  private

  def cache_key
    "cache_proxy:#{@url}"
  end
end
