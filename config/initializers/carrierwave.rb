
CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider                  => 'AWS',
    :aws_access_key_id         => 'AKIAJZXEHUBPANKF33UA',
    :aws_secret_access_key     => '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'
  }
  config.fog_directory = 'combray'
  config.fog_public = true
end
