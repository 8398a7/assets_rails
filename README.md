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

## Contributing

1. Fork it ( https://github.com/8398a7/assets_rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
