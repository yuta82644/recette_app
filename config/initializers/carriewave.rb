# config/initializers/carrierwave.rb

require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
      region:                'ap-northeast-1',
      path_style:            true,
    }

    config.fog_public     = false
    config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}
    
    config.fog_directory = 'recette-recette-production'
    config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/recette-production'
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?  # テスト環境では処理を無効化
  end
end
