## Initializer file containing default options for paperclip gem and file upload
Paperclip::Attachment.default_options[:storage] = :s3
Paperclip::Attachment.default_options[:s3_protocol] = :https
Paperclip::Attachment.default_options[:preserve_files] = Rails.env.production?
Paperclip::Attachment.default_options[:s3_region] = ENV['PAPERCLIP_AWS_DEFAULT_REGION']
Paperclip::Attachment.default_options[:s3_credentials] = {
  :bucket => ENV['PAPERCLIP_AWS_BUCKET_ID'],
  :access_key_id => ENV['PAPERCLIP_AWS_ACCESS_KEY_ID'],
  :secret_access_key => ENV['PAPERCLIP_AWS_SECRET_ACCESS_KEY']
}
# Paperclip::Attachment.default_options[:s3_host_name] = "s3.amazonaws.com"
