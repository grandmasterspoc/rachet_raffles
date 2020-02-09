# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :instagram, ENV['RR_INSTA_ID'],
#                               ENV['RR_INSTA_SECRET'],
#                               scope: 'basic',
#                               setup: true,
#                               callback_url: 'http://www.velvi.io/users/auth/instagram/callback'
#
#   # provider :google_oauth2, ENV['VELVI_YOUTUBE_CLIENT_ID'], ENV['VELVI_YOUTUBE_CLIENT_SECRET'], scope: 'userinfo.profile,youtube'
#
#   on_failure { |env| AuthenticationsController.action(:failure).call(env) }
# end
