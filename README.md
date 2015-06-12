# belvedere
[![Circle CI](https://circleci.com/gh/realmlabs/belvedere.svg?style=shield)](https://circleci.com/gh/realmlabs/belvedere)

This project exists as an example for continuous integration of Elixir on CircleCI.  
It also works as a bit of a boilerplate project.

## Features:
  - Builds your project as a docker container, and automatically pushes it to dockerhub if tests pass
  - Runs Dialyzer on your project
  - Caches build environment and container layers for quick build times.

### HowTo
Getting this going in your project:

  - Copy the scripts/ci folder, circle.yml & Dockerfile to your project.
  - Update the Erlang and Elixir versions to the latest in the Dockerfile
  - Set CIRCLE_PROJECT_REPONAME in the Dockerfile to your project's name
  - Make changes to the Docker File as appropriate for your project
  - Specify the deps and apps you care about for dialyzer in your mix file. (see our example)
  - Add credentials for the Docker.com repo to your CircleCI account (optional for deployment)
    https://circleci.com/docs/docker
  - Add the repo to CircleCI so that the webhook is installed

###Deploying to Docker Hub

  This example also deploys the built image to Docker Hub after successfully building and testing. See the `deployment` section of [circle.yml](circle.yml) for details on how this is done. Note that three environment variables need to be set on CircleCI for the deployment to work:

  * DOCKER_EMAIL - The email address associated with the user with push access to the Docker Hub repository
  * DOCKER_USER - Docker Hub username
  * DOCKER_PASS - Docker Hub password (these are all stored encrypted on CircleCI, and you can create a deployment user with limited permission on Docker Hub if you like)

  Also note that the Docker Hub repository name and Docker registry endpoint are hard-coded into [circle.yml](circle.yml) and [.dockercfg.template](.dockercfg.template) respectively and would need to be changed to deploy to a different repository or registry.

  ##See also
  * [CircleCI Home](https://circleci.com)
  * [The CircleCI Docker docs](https://circleci.com/docs/docker)
  * [The Docker userguide](http://docs.docker.com/userguide/)
  * [Docker Hub](https://hub.docker.com/)
### To Do:
  - Add publishing to hex.docs: https://hex.pm/docs/tasks#hex_docs
  https://github.com/elixir-lang/ex_doc
  - Add publishing to hex: https://hex.pm/docs/tasks#hex_publish
