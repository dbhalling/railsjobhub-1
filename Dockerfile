FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y postgresql-client
RUN mkdir /railsjobhub
WORKDIR /railsjobhub
COPY Gemfile /railsjobhub/Gemfile
COPY Gemfile.lock /railsjobhub/Gemfile.lock
COPY . /myapp

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

# yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -\
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y yarn

# Remove folders not needed in resulting image
# RUN rm -rf node_modules tmp/cache vendor/assets lib/assets spec

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["bundle", "rails", "server", "-b", "0.0.0.0"]
