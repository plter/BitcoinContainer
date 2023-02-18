FROM debian:bullseye-slim

RUN apt-get update&&apt-get install -y wget
ENV APP_ROOT=/apps/bitcoin
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

ENV BITCOIN_VERSION=22.0
RUN wget https://bitcoin.org/bin/bitcoin-core-${BITCOIN_VERSION}/bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz
RUN tar xzvf bitcoin-${BITCOIN_VERSION}-x86_64-linux-gnu.tar.gz
ENV PATH=$PATH:$APP_ROOT/bitcoin-$BITCOIN_VERSION/bin

CMD bitcoind