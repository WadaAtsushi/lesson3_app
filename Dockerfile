FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /lesson3_app
WORKDIR /lesson3_app
COPY Gemfile /lesson3_app/Gemfile
COPY Gemfile.lock /lesson3_app/Gemfile.lock
RUN bundle install
COPY . /lesson3_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]