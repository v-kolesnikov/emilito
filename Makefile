start:
		docker-compose up -d

stop:
		docker-compose stop

test:
		docker-compose run --rm app bundle exec rake

install:
		bundle exec rails db:setup
		bundle exec rails db:migrate

api_doc:
		raml2html -i api/api.raml -o public/api.html

.PHONY: test
