# -*- encoding: utf-8 -*-
# stub: capistrano-postgresql 6.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "capistrano-postgresql".freeze
  s.version = "6.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bruno Sutic".freeze, "Ruben Stranders".freeze]
  s.date = "2018-10-06"
  s.description = "Capistrano tasks for PostgreSQL configuration and management for Rails\napps. Manages `database.yml` template on the server.\nWorks with Capistrano 3 (only!). For Capistrano 2 support see:\nhttps://github.com/bruno-/capistrano2-postgresql\n".freeze
  s.email = ["bruno.sutic@gmail.com".freeze, "r.stranders@gmail.com".freeze]
  s.homepage = "https://github.com/capistrano-plugins/capistrano-postgresql".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.3".freeze
  s.summary = "Creates application database user and `database.yml` on the server. No SSH login required!".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>.freeze, [">= 3.0"])
      s.add_runtime_dependency(%q<sshkit>.freeze, [">= 1.17.0"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    else
      s.add_dependency(%q<capistrano>.freeze, [">= 3.0"])
      s.add_dependency(%q<sshkit>.freeze, [">= 1.17.0"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<capistrano>.freeze, [">= 3.0"])
    s.add_dependency(%q<sshkit>.freeze, [">= 1.17.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
