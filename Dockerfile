# Rubyのバージョン
FROM ruby:2.6.5
#dockerizeパッケージダウンロード用環境変数
ENV DOCKERIZE_VERSION v0.6.1
# curl -sS でエラー以外の出力の抑制
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

#パッケージの取得
RUN apt-get update && \
    apt-get install -y --no-install-recommends\
    nodejs  \
    mariadb-client  \
    build-essential  \
    wget \
    && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# プロジェクトのディレクトリをコンテナに作成
RUN mkdir /furima-30526

# 作業ディレクトリに↑で作成したディレクトリを指定
WORKDIR /furima-30526

# Gemfileを作業ディレクトリにコピー
ADD Gemfile /furima-30526/Gemfile
ADD Gemfile.lock /furima-30526/Gemfile.lock

# gemのインストール
RUN gem install bundler
RUN bundle install

# プロジェクト本体をコンテナにコピー
ADD . /furima-30526

# コンテナ起動時にRailsサーバーが起動するようにする
CMD ["rails", "server", "-b", "0.0.0.0"]
