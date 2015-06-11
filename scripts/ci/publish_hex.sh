#clone and compile ExDoc
cd /$HOME/dependencies
git clone https://github.com/elixir-lang/ex_doc.git
cd ex_doc
mix do deps.get, compile

/$HOME/dependencies/ex_doc/bin/ex_doc $CIRCLE_PROJECT_REPONAME $PROJECT_VERSION path/to/project/ebin -m $PROJECT_MODULE -u https://github.com/$GITHUB_USER/$GITHUB_REPO

