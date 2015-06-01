# belvedere
A process which shuffles your code around until you have the result you want.

### To Do:
1. Make this a docker container and get it building on CircleCI
2. Break out the build phase so that deps get updated when they change.

## HowTo

This repo demos using CircleCI for an elixir project.

Getting this going in your project:

1. Copy the scripts/ci folder to your project.
2. Copy the circle.yml file to your project
2. Update the Erlang and Elixir versions to the latest in the scripts
3. Add the repo to CircleCI so that the webhook is installed
4. Viola, that should be it.  


### How it works

The heavy lifting is done in two scripts:
scripts/ci/prepare.sh - Installs Erlang and Elixir, builds the code
scripts/ci/test.sh - Runs the tests

circle.yml - caches build products and deps (which might be bad) so that
your builds will be faster. (building erlang from source by itself
takes quite awhile.)
