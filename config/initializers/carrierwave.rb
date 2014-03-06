CarrierWave.configure do |config|

  config.fog_credentials = {
    :provider                 => 'AWS',
    :aws_access_key_id        => ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key    => ENV['AWS_SECRET_ACCESS_KEY']
  }

  config.storage = :fog
  config.fog_directory = 'combray_gallery'
  config.fog_public = true
end
