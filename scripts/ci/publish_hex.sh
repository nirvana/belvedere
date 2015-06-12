cd /$HOME/dependencies
git clone https://github.com/elixir-lang/ex_doc.git
cd ex_doc
mix do deps.get, deps.compile, compile

cd /$HOME/dependencies/ex_doc/bin
mix compile

/$HOME/dependencies/ex_doc/bin/ex_doc $PROJECT_NAME $PROJECT_VERSION /$HOME/$CIRCLE_PROJECT_REPONAME/ebin -m $PROJECT_MODULE$ -u https://github.com/$GITHUB_USER/$GITHUB_REPO

#cd /$HOME/$CIRCLE_PROJECT_REPONAME/deps/ex_doc
#mix do deps.get, deps.compile, compile
#mix docs
