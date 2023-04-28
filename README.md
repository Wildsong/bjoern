# bjoern-template

Python Flask template based on Bjoern, "a screamingly fast WSGI server".

This is a template that I use to test Bjoern
and have adapted MapProxy and other projects to use it.

## Template how-to

I have only copied it manually so far! I will try this and write more here.
I presume you create a new repo and tell it to use this as the template and that
it copies all the files for you into the new project. Then you would add your own
app in the "app" folder and change the application name in compose.yaml.

I'd be testing the app in my VS Code environment at this point, to make sure it works as
a plain Flask app. Once I had everything going there, I would dockerize it.

On my development machine I keep a conda environment called "flask" around for testing in VSCode. It has the gh commands in it too. (In theory this works on Windows or Linux.)

    conda create -n flask -c conda-forge --file requirements.txt
    conda activate flask # (gh is installed here)
    conda install -c conda-forge autopep8 gh # dev only, therefore not in requirements.txt

To "dockerize" you would change the image name in the commands below and in compose.yaml
and proceed with the build and run steps. Your app gets copied into the image in the build.
This makes using it in Docker Swarm easy. In theory.

## Build

This might already be done, it's in a registry.
After making changes, build again. Push the image up to Docker.

    docker buildx build -t wildsong/bjoern .
    docker push wildsong/bjoern

I had to set up a docker credential for push to docker.

I also switched to using HTTPS instead of SSH for github, so I have to remember to log in from time to time!

    gh auth login
    git push

## Run

If everything works perfectly, this would be next.

    docker stack deploy -c compose.yaml bjoern-test
    docker service logs bjoern-test_hello
    -- or perhaps --
    docker compose up -d

Then go to http://localhost:12345/
The port is set arbitrarily to 12345 in the compose.yaml file. It defaults to port 80 internally.

In the imperfect world, try "docker compose up" without the "-d", 
it spits log messages to the console instead of going into daemon mode,
or connect via bash so you can poke around and see what's missing.

    docker run -it wildsong/bjoern bash

## Resources

Where to get "gh": https://github.com/cli/cli#installation

## To do

There is always more.

* Finish the launch.json file
* I'd like a better healthcheck than "curl". I have Python + requests available for this. Elton Stoneman says it's better.
* Add version numbers in requirements.txt ?? Best practice ?? Mmm?
