Reproduce the issue described in https://github.com/hotwired/turbo-rails/issues/285#issuecomment-1104906695

* Run `bundle exec rake` and you'll get a green test.
* If you uncomment the `gem "rails_api_logger", path: 'rails_api_logger' # <-- comment this line and test is green` line, you'll get a failing test and the error

`LoadError: cannot load such file -- /Users/coorasse/.rbenv/versions/3.1.0/lib/ruby/gems/3.1.0/gems/turbo-rails-1.0.1/app/channels/turbo/streams`

* If you use `gem "rails_api_logger", github: 'renuo/rails_api_logger', branch: 'new_logger'` instead, it all works fine again.
