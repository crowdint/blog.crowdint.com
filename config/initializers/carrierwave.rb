CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog

    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY'],
      :aws_secret_access_key  => ENV['AWS_SECRET_KEY']
      #:region                 => 'us-east-1'
    }
    config.fog_directory  = ENV['AWS_BUCKET']
    config.fog_public     = true
    config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}
  else
    config.storage = :file
  end
end
