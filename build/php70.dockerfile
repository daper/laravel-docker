FROM daper/php:7.0

RUN apk --update upgrade \
    && apk add nodejs@edge python nasm \
    && npm i -g yarn
