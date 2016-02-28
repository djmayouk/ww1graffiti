OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '990425327702070', '991f16b1036f77871a7504d96574aec5', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end
