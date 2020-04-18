FROM ruby:alpine

RUN apk add build-base
RUN apk add ruby-dev
RUN apk add bash

WORKDIR /app

COPY . ./

RUN bundle -j $(nproc)

CMD [ "tail", "-f", "/dev/null" ]
