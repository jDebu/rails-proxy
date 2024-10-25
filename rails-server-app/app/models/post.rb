class Post < ApplicationRecord
  after_commit :clear_cache

  private

  def clear_cache
    base_url = Rails.application.credentials.base_url

    match_pattern = "cache_proxy:#{base_url}/posts*"

    Rails.cache.redis.with do |redis|
      redis.scan_each(match: match_pattern) do |key|
        Rails.cache.delete(key)
        Rails.logger.info "Deleted cache: #{key}"
      end
    end
  end
end
