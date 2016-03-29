# assets_rails

**Requirements**

- [node](http://nodejs.org)

**Compatible**
- [bower](https://github.com/bower/bower)
- [npm](https://www.npmjs.com)
- others(pnpm, ied...)

**Install**

in Gemfile

```ruby
  gem 'assets_rails'
```

## Usage

add `config/application.rb`
```ruby
config.assets.paths << Rails.root.join('node_modules') # if use npm
config.assets.paths << Rails.root.join('bower_components') # if use bower
config.assets.components = %w(npm bower) # if use npm and bower
```

example for npm
```sh
npm init -y
npm install bootstrap --save
```

example for bower
```sh
bower init -y
bower install bootstrap --save
```

## Capistrano 3 Configuration

```ruby
namespace :assets_rails do
  desc 'Install assets and resolve assets'
  task :install do
    on roles(:web) do
      within release_path do
        execute :rake, 'assets_rails:install assets_rails:resolve RAILS_ENV=production'
      end
    end
  end
end
before 'deploy:compile_assets', 'assets_rails:install'
```
