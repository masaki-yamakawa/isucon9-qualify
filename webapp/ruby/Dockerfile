FROM ruby:2.7.1
RUN apt-get update \
 && apt-get install -y \
    mariadb-client \
    less
COPY . /app
WORKDIR /app
RUN bundle install
ENTRYPOINT ["bundle", "exec", "rackup", "--port", "8000", "--host", "0.0.0.0"]
