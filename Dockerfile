FROM ruby:2.2.1
MAINTAINER Nick Robinson <nick@isengard.io>

RUN apt-get update && \
    apt-get install -y net-tools

# Install gems
ENV APP_HOME /app
ENV HOME /root
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/
RUN bundle install

# Upload source
COPY . $APP_HOME

#Set Env Variables
ENV RACK_ENV production

# Start server
ENV PORT 80
EXPOSE 80
CMD ["ruby", "app.rb"]