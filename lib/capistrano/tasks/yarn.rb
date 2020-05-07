namespace :yarn do
          set :yarn_target_path, nil
          set :yarn_flags, '--production'
          set :yarn_roles, :all
          set :yarn_env_variables, {}
          set :yarn_bin, :yarn

  task :install do
    on roles fetch(:yarn_roles) do
      within fetch(:yarn_target_path, release_path) do
        with fetch(:yarn_env_variables, {}) do
          execute fetch(:yarn_bin), 'install', fetch(:yarn_flags)
        end
      end
    end
  end

  before 'deploy:updated', 'yarn:install'


  task :prune do
    on roles fetch(:yarn_roles) do
      within fetch(:yarn_target_path, release_path) do
        execute fetch(:yarn_bin), 'prune', fetch(:yarn_prune_flags)
      end
    end
  end



  task :rebuild do
    on roles fetch(:yarn_roles) do
      within fetch(:yarn_target_path, release_path) do
        with fetch(:yarn_env_variables, {}) do
          execute fetch(:yarn_bin), 'rebuild'
        end
      end
    end
  end
end

namespace :load do
  task :defaults do
    set :yarn_flags, %w(--production)
    set :yarn_prune_flags, ''
    set :yarn_roles, :all
    set :yarn_bin, :yarn
  end
end
