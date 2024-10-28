class Post < ApplicationRecord
  include CacheInvalidation

  after_commit :clear_cache

  private

  def clear_cache
    invalidate_cache_for_posts
  end
end
