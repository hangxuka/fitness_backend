# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  def filename
     "#{secure_token(10)}.#{file.extension}"
  end
  private
  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end
end
