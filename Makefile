test:
		bundle exec rake

install:
		bundle exec rails db:setup
		bundle exec rails db:migrate

.PHONY: test
