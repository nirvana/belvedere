export CIRCLE_PROJECT_REPONAME="belvedere" # name this your project

export MIX_ENV="test"
export PATH="$HOME/dependencies/erlang/bin:$HOME/dependencies/elixir/bin:$PATH"

# Fetch and compile dependencies and application code (and include testing tools)
cd $HOME/$CIRCLE_PROJECT_REPONAME
mix do deps.get, deps.compile, compile
