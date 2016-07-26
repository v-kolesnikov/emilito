install:
		bundle exec rake db:setup

test:
		bundle exec rake RAILS_ENV=test
