Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "413968049768-ts4inm34b6tddf9odf8pm28t8e4e9vgn.apps.googleusercontent.com", "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",  { :redirect_uri => "http://localhost:3000/users/auth/google_oauth2/callback" }


end
OmniAuth.config.allowed_request_methods = %i[get]