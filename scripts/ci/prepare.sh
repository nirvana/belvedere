
set -e

export ERLANG_VERSION="17.5"
export ELIXIR_VERSION="v1.0.4"

export INSTALL_PATH="$HOME/dependencies"

export ERLANG_PATH="$INSTALL_PATH/otp_src_$ERLANG_VERSION"
export ELIXIR_PATH="$INSTALL_PATH/elixir_$ELIXIR_VERSION"
export DIALYZER_PATH="$INSTALL_PATH/dialyxir"

mkdir -p $INSTALL_PATH
cd $INSTALL_PATH

echo "Installing erlang... "
if [ ! -e $ERLANG_PATH/bin/erl ]; then
  curl -O http://www.erlang.org/download/otp_src_$ERLANG_VERSION.tar.gz
  tar xzf otp_src_$ERLANG_VERSION.tar.gz
  cd $ERLANG_PATH
  echo "Installing erlang... configure "
  ./configure --enable-smp-support \
              --enable-m64-build \
              --disable-native-libs \
              --disable-sctp \
              --enable-threads \
              --enable-kernel-poll \
              --disable-hipe \
              --without-javac
  echo "Installing erlang...making "
  make

  # Symlink to make it easier to setup PATH to run tests
  ln -sf $ERLANG_PATH $INSTALL_PATH/erlang
fi

# Install elixir
export PATH="$ERLANG_PATH/bin:$PATH"

if [ ! -e $ELIXIR_PATH/bin/elixir ]; then
  git clone https://github.com/elixir-lang/elixir $ELIXIR_PATH
  cd $ELIXIR_PATH
  git checkout $ELIXIR_VERSION
  echo "Installing elixir... "
  make

  # Symlink to make it easier to setup PATH to run tests
  ln -sf $ELIXIR_PATH $INSTALL_PATH/elixir
fi
export PATH="$ERLANG_PATH/bin:$ELIXIR_PATH/bin:$PATH"
elixir -v

echo "Installing dialyxir... "
# Install dialyxir
if [ ! -e $DIALYZER_PATH/bin/elixir ]; then
  git clone https://github.com/jeremyjh/dialyxir $DIALYZER_PATH
  cd $DIALYZER_PATH
  echo "Installing dialyxir...building archive "
  mix archive.build
  echo "Installing dialyxir...installing archive "
  yes | mix archive.install
  echo "Installing dialyxir... analyzing base modules.  This will take awhile."
  mix dialyzer.plt
  echo "Installing dialyxir...done "

  # Symlink to make it easier to setup PATH to run tests
  ln -sf $DIALYZER_PATH $INSTALL_PATH/dialyxir
fi

echo "Installing package tools... "

# Install package tools
if [ ! -e $HOME/.mix/rebar ]; then
  yes Y | LC_ALL=en_GB.UTF-8 mix local.hex
  yes Y | LC_ALL=en_GB.UTF-8 mix local.rebar
fi
