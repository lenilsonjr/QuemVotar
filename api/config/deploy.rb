set :application, "quemvotar_api"
set :repo_url, "git@github.com:lenilsonjr/QuemVotar.git"
set :repo_tree, 'api'

set :use_sudo, false

set :rvm_ruby_version, '2.3.3'
set :rvm_custom_path, '/usr/share/rvm'

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
