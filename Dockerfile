FROM python:3.4-wheezy

# Update python package managers
RUN wget https://bootstrap.pypa.io/ez_setup.py -O - | python

# Prepare nodejs
RUN curl https://deb.nodesource.com/setup | bash
RUN apt-get update && apt-get install -y \
    nodejs \
    ruby \
    ruby1.9.1-dev

RUN curl https://rubygems.org/rubygems/rubygems-2.6.3.tgz --location | tar -xz
WORKDIR rubygems-2.6.3
RUN ruby setup.rb --silent
WORKDIR /
RUN rm -r rubygems-2.6.3

RUN gem install compass
