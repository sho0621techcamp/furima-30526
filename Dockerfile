# Rubyのバージョン
FROM ruby:2.6.5

# curl -sS でエラー以外の出力の抑制
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# yarn node.jsのインストール(apt-get -yでyes/noを聞かれないようにする必要がある)
RUN apt-get update && \
apt-get install -y yarn nodejs --no-install-recommends && \
rm -rf /var/lib/apt/lists/*

# プロジェクトのディレクトリをコンテナに作成
RUN mkdir /qiita_test

# 作業ディレクトリに↑で作成したディレクトリを指定
WORKDIR /qiita_test

# Gemfileを作業ディレクトリにコピー
ADD Gemfile /qiita_test/Gemfile
ADD Gemfile.lock /qiita_test/Gemfile.lock

# gemのインストール
RUN gem install bundler
RUN bundle install

# プロジェクト本体をコンテナにコピー
ADD . /qiita_test

# コンテナ起動時にRailsサーバーが起動するようにする
CMD ["rails", "server", "-b", "0.0.0.0"]
