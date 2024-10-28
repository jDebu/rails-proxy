require "#{Rails.root}/app/models/concerns/cache_invalidation"

Thread.new do
  ActiveRecord::Base.connection.execute("LISTEN post_changes")
  loop do
    ActiveRecord::Base.connection.raw_connection.wait_for_notify do |channel, pid, payload|
      extend CacheInvalidation
      invalidate_cache_for_posts
    end
  end
end
