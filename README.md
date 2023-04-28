# bjoern-template

Python Flask template based on Bjoern, "a screamingly fast WSGI server".

This is a template that I use to test Bjoern and have adapted MapProxy and
other projects to use it.

## Precis

In a perfect world,

    docker buildx build -t wildsong/bjoern .
    docker compose up
    --or--
    docker push wildsong/bjoern
    docker stack deploy -c compose.yaml bjoern-test
    Go to http://localhost:12345/

    gh auth login
    git push

In the imperfect world,

    docker run -it wildsong/bjoern bash
