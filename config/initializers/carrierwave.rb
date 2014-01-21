CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider                  => 'AWS',
    :aws_access_key_id         => 'XXXXXX',
    :aws_secret_access_key     => 'XXXXXX'
  }
  config.fog_directory = 'combray'
  config.fog_public = true
end
