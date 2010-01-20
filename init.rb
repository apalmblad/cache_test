if RAILS_ENV == "test"

  require 'active_support/test_case'
  require 'test_caching_hack'

  ActionController::Base.perform_caching = true
  ActiveSupport::TestCase.send(:include, CacheTest::PageCacheTest::IntegrationTestMethods)
  ActionController::Base.send( :include, CacheTest::PageCacheTest::ClassCachingMethods )
  ActiveSupport::TestCase.send(:include, CacheTest::FragmentCacheTest::Assertions)
  ActiveSupport::TestCase.send( :define_method, :cache_store ) do
    ActionController::Base.cache_store
  end
  
end

