# Fetch and compile dependencies and application code (and include testing tools)
cd /$HOME/$CIRCLE_PROJECT_REPONAME
mix do deps.get, deps.compile, compile