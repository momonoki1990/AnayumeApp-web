# pumaのpidファイル、設定ファイルのディレクトリを指定
namespace :puma do
  task :environment do
    set :puma_pid,    "#{current_path}/tmp/pids/puma.pid"
    set :puma_config, "#{current_path}/config/puma.rb"
  end

  # pumaをスタートさせるメソッド
  def start_puma
    within current_path do
      execute :bundle, :exec, :puma, "-C #{fetch(:puma_config)} -e #{fetch(:rails_env)} -d"
    end
  end

  # pumaを停止させるメソッド
  def stop_puma
    execute :kill, "-s QUIT $(< #{fetch(:puma_pid)})"
  end

  # pumaを再起動するメソッド
  def reload_puma
    execute :kill, "-s SIGUSR2 $(< #{fetch(:puma_pid)})"
  end

  # pumaを強制終了するメソッド
  def force_stop_puma
    execute :kill, "$(< #{fetch(:puma_pid)})"
  end

  # pumaをスタートさせるtask
  desc "Start puma server"
  task start: :environment do
    on roles(:app) do
      start_puma
    end
  end

  # pumaを停止させるtask
  desc "Stop puma server gracefully"
  task stop: :environment do
    on roles(:app) do
      stop_puma
    end
  end

  # 既にpumaが起動している場合再起動を、まだの場合起動を行うtask
  desc "Restart puma server gracefully"
  task restart: :environment do
    on roles(:app) do
      if test("[ -f #{fetch(:puma_pid)} ]")
        reload_puma
      else
        start_puma
      end
    end
  end

  # pumaを強制終了させるtask
  desc "Stop puma server immediately"
  task force_stop: :environment do
    on roles(:app) do
      force_stop_puma
    end
  end
end
