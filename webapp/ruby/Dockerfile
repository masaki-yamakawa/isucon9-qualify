FROM ruby:2.7.1
RUN apt-get update \
 && apt-get install -y \
    mariadb-client
COPY . /app
WORKDIR /app
RUN bundle install
ENTRYPOINT ["bundle", "exec", "rackup"]
CMD ["--port", "8000", "--host", "0.0.0.0"]
