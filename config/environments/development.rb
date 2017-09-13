Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # This shows Paperclip where to look for stuff:
  Paperclip.options[:command_path] = "/usr/local/bin/"

  config.paperclip_defaults = {
  storage: :s3,

  # url: '/public/:id_:filename',
  path: '/public/:id_:filename',

  s3_credentials: {
    bucket: ENV['S3_BUCKET_NAME'],
    access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    s3_region: ENV['AWS_REGION'],
    s3_host_name: 's3.us-east-2.amazonaws.com',
    s3_protocol: ":https"
  }
}
end

  # url: 'https://s3.us-east-2.amazonaws.com',
  # path: '/public/:id:basename.:extension',
  # path: '/public/default.png',
  # path: ':class/:attachment:id',

    # https://s3.us-east-2.amazonaws.com/glibs-image-bucket/pictures/images/000/000/057/glib/(Old_Faithful_2.0).jpg


# http://s3.us-east-2.amazonaws.com/glibs-image-bucket/Users/gabrielosborne/Desktop/DBC/finalProject/Operation-Glibs/public/public/images/42_IMG_3071.JPG?1505259477
