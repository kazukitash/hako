# Ubuntuは20.04を入れている
FROM ubuntu:focal
RUN apt-get update && apt-get install -y tzdata
# timezone setting
ENV TZ=Asia/Tokyo
# git curl build-essential と python ruby-build に必要な package をインストールする
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  git curl build-essential openssl \
  libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev \
  autoconf bison patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
# linuxbrew は root で入れられないので linuxbrew ユーザーを作成する
RUN useradd -m linuxbrew
RUN chmod 755 /home/linuxbrew
RUN echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>/etc/profile.d/.zshenv
USER linuxbrew
RUN /bin/bash -c "$(curl -L raw.githubusercontent.com/kazukitash/dotfiles/main/install.sh)"
# default shell を zsh にする
USER root
RUN echo /home/linuxbrew/.linuxbrew/bin/zsh >>/etc/shells
RUN chsh -s /home/linuxbrew/.linuxbrew/bin/zsh
