FROM andbrandao/andersonbrandao.dev:1.0

RUN apt-get update && apt-get -y install postgresql-client libpq-dev memcached imagemagick ffmpeg mupdf mupdf-tools libxml2-dev curl build-essential patch ruby-dev zlib1g-dev liblzma-dev nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get -y install yarn

RUN mkdir -p /andersonbrandao.dev
WORKDIR /andersonbrandao.dev
COPY Gemfile /andersonbrandao.dev/Gemfile
COPY Gemfile.lock /andersonbrandao.dev/Gemfile.lock
RUN bundle install
COPY package.json yarn.lock ./
RUN yarn install --check-files
COPY . /andersonbrandao.dev

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3002

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]