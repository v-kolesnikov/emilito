test:
		bundle exec rake

install:
		bundle exec rails db:setup
		bundle exec rails db:migrate

api_doc:
		raml2html -i api/api.raml -o public/api.html

docker-build:
		docker build -t emilito

docker-volumes:
		docker-compose run data bash

rails-c:
		docker-compose run web rails c

.PHONY: test
