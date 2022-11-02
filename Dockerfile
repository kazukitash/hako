# devcontainer用のUbuntu-20.04 Image
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-20.04

# apt-getでUIを使うインストールを避ける
ENV DEBIAN_FRONTEND noninteractive

# Localeの設定
RUN export LC_ALL=C

# タイムゾーンの設定
RUN apt-get update && apt-get install -y tzdata
ENV TZ Asia/Tokyo

# 基本パッケージをインストール
RUN apt-get update && apt-get install -y build-essential procps curl file wget git

# ruby-build用のパッケージをインストール
RUN apt-get update && apt-get install -y autoconf bison patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

# python用のパッケージをインストール
RUN apt-get update && apt-get install -y libbz2-dev libreadline-dev liblzma-dev libncursesw5-dev libsqlite3-dev uuid-dev tk-dev

# aptのcacheを消す
RUN apt-get clean

USER vscode
RUN /bin/bash -c "$(curl -L raw.githubusercontent.com/kazukitash/dotfiles/main/install.sh)"

# デフォルトシェルをzshにする
USER root
RUN chsh vscode -s /home/linuxbrew/.linuxbrew/bin/zsh
CMD ["/home/linuxbrew/.linuxbrew/bin/zsh"]
