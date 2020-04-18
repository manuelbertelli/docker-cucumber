FROM ruby:alpine

RUN apk add build-base
RUN apk add ruby-dev
RUN apk add bash

WORKDIR /app

COPY . ./

RUN bundle

RUN adduser runner -D

USER runner

CMD [ "tail", "-f", "/dev/null" ]
