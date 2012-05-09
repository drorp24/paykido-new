unless defined?($redis)

  REDIS_CONFIG = YAML.load(File.open("#{Rails.root}/config/redis.yml")).with_indifferent_access[Rails.env].merge(:thread_safe => true)
  # require 'redis/objects'
  $redis = Redis.new(REDIS_CONFIG)
  # $redis = Redis.new(:host => 'localhost', :port => 6379)  
  
  # Redis::Objects.redis = Redis.new(REDIS_CONFIG)
  # require 'rails_feature_management'    
  
  # Rails.feature_manager.engine = $redis
  #Rails.feature_manager.safe_mode!
end

