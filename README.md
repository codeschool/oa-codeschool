# oa-codeschool

A backward-compatible OmniAuth gem strategy for Code School.

There a new [omniauth-codeschool](https://github.com/codeschool/omniauth-codeschool)
gem but it requires OmniAuth 1.x and above. This strategy is compatible
with OmniAuth 0.2.x which we still use in older apps.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'oa-codeschool'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install oa-codeschool
```

## Usage

In your config/initializers/omniauth.rb :

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider OmniAuth::Strategies::CodeSchool, 'client_id', 'client_secret'
end
```

By default, the `base_uri` for code_path is set to http://localhost:3000.
In different environments you may want to change it:

```ruby
OmniAuth::Strategies::CodePath.base_uri = "http://codepath.com"
```

Then all you have to do is redirect the `/` link to `/auth/code_school` and
OmniAuth will take care of the rest


## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md).

## License
See [LICENSE][LICENSE].
