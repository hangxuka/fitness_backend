# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  def filename
     "#{secure_token(10)}.#{file.extension}" if original_filename.present?
  end
  private
  def secure_token(length=16)
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.hex(length/2))
  end
end
