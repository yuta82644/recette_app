require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory = 'recette-production'
    config.fog_public = false
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1',
      path_style: true
    }
      config.fog_public     = false
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
  end
  case Rails.env
    when 'production'
      config.fog_directory = 'recette-production'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/recette-production'
  end

end
