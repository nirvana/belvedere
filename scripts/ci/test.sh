export CIRCLE_PROJECT_REPONAME="belvedere" # name this your project
export MIX_ENV="test"
export PATH="$HOME/dependencies/erlang/bin:$HOME/dependencies/elixir/bin:$PATH"

cd $HOME/$CIRCLE_PROJECT_REPONAME

mix test

mix dialyzer
