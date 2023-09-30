
# whenever 定期実行


# Rails.root(Railsメソッド)を使用するために必要
require File.expand_path(File.dirname(__FILE__) + "/environment")

# .zshrcとrbenvのパスを指定するrakeを定義
job_type :rake, "source /Users/y.takashi/.zshrc; export PATH=\"$HOME/.rbenv/bin:$PATH\"; eval \"$(rbenv init -)\"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output"

# 環境変数'RAILS_ENV'にセットされている変数またはdevelopmentを指定
rails_env = ENV['RAILS_ENV'] || :development

# cronを実行する環境変数をセット
set :environment, rails_env
# set :environment, :production

# cronのログの吐き出し場所
set :output, "#{Rails.root}/log/cron.log"




every 1.minutes do
  rake "api_date_save:Mouser_API_date_save"
  rake "reminder:reminder_mail"
end 