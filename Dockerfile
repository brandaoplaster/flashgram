FROM ruby:2.7.1

# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
build-essential nodejs yarn libpq-dev imagemagick git-all nano

# Set path
ENV INSTALL_PATH /fashgram

# Create directory
RUN mkdir -p $INSTALL_PATH

# Set path as the main directory
WORKDIR $INSTALL_PATH

# Copy Gemfile into the container.
COPY Gemfile ./

# Set the path to the gems
ENV BUNDLE_PATH /box

# Copy code into the container
COPY . .