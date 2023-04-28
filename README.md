# docker-bjoern

Python Flask template based on Bjoern, "a screamingly fast WSGI server".

This is a template that I use to test Bjoern and have adapted MapProxy and
other projects to use it.

## Precis

In a perfect world,

    docker buildx build -t ghcr.io/clatsopcounty/bjoern .
    docker compose up
    --or--
    docker push ghcr.io/clatsopcounty/bjoern
    docker stack deploy -c compose.yaml bjoern-test
    Go to http://cc-testmaps:12345/

In the imperfect world,

    docker run -it cc/bjoern bash

    bjoern-test | [INFO] 2023-02-25 00:08:18,573 requestlogger --- 404, {
        'PATH_INFO': '/favicon.ico', 
        'HTTP_HOST': 'localhost:8889', 
        'HTTP_USER_AGENT': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0', 
        'HTTP_ACCEPT': 'image/avif,image/webp,*/*', 
        'HTTP_ACCEPT_LANGUAGE': 'en-US,en;q=0.5', 
        'HTTP_ACCEPT_ENCODING': 'gzip, deflate, br', 
        'HTTP_CONNECTION': 'keep-alive', 
        'HTTP_REFERER': 'http://localhost:12345/', 
        'HTTP_SEC_FETCH_DEST': 'image', 
        'HTTP_SEC_FETCH_MODE': 'no-cors', 
        'HTTP_SEC_FETCH_SITE': 'same-origin', 
        'HTTP_SEC_GPC': '1', 
        'SERVER_PROTOCOL': 'HTTP/1.1', 
        'REQUEST_METHOD': 'GET', 
        'REMOTE_ADDR': '172.29.0.1', 'wsgi.input': <_io.BytesIO object at 0x7f9bb4489990>, 'wsgi.file_wrapper': <class 'FileWrapper'>, 
        'SCRIPT_NAME': '', 
        'wsgi.version': (1, 0), 
        'wsgi.input_terminated': True, 
        'wsgi.url_scheme': 'http', 'wsgi.errors': <_io.TextIOWrapper name='<stderr>' mode='w' encoding='utf-8'>, 'wsgi.multithread': False, 'wsgi.multiprocess': True, 'wsgi.run_once': False, 'SERVER_NAME': '0.0.0.0', 'SERVER_PORT': '80', 'werkzeug.request': None}, 207
