if defined?(AssetSync)
  AssetSync.configure do |config|
    config.fog_provider = 'AWS'
    config.aws_access_key_id = ENV['AWS_ACCESS_KEY']
    config.aws_secret_access_key = ENV['AWS_SECRET_KEY']
    config.fog_directory = ENV['AWS_BUCKET']
    config.gzip_compression = true
    config.fail_silently = true
    config.existing_remote_files = 'keep'
  end
end
