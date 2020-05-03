require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AnayumeApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # 認証トークンをremoteフォームに埋め込む(JavaScriptが無効になっていた時の為の設定, Ajax関連)
    config.action_view.embed_authenticity_token_in_remote_forms = true
    # デフォルトのlocaleを日本語(:ja)にする
    config.i18n.default_locale = :ja
    # pathを通す
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # rspecのファイルをモデルやコントローラー作成に応じて自動生成
    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
