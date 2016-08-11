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

docker-build-raml2html:
		cd api && docker build -t raml2html .

docker-api-doc: docker-build-raml2html
		cd api && docker run -v $(CURDIR)/api:/api -v $(CURDIR)/public:/public raml2html raml2html -i /api/api.raml -o /public/api.html

rails-c:
		docker-compose run web rails c

.PHONY: test
