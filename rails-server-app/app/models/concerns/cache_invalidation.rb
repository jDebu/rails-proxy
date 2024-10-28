module CacheInvalidation
  extend ActiveSupport::Concern

  def invalidate_cache_for_posts
    base_url = Rails.application.credentials.base_url
    match_pattern = "cache_proxy:#{base_url}/posts*"

    Rails.cache.redis.with do |redis|
      redis.scan_each(match: match_pattern) do |key|
        Rails.cache.delete(key)
        Rails.logger.info "Cache invalidated for key: #{key}"
      end
    end
  end
end
