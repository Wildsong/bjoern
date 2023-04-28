FROM tecktron/python-bjoern

# Refer to https://github.com/Tecktron/docker-python-bjoern
# Keep in mind this is a Debian + Python based image

# Add flask and anything else you need
RUN pip install \
  flask flask-wtf flask-bootstrap flask-debugtoolbar \
  requests jinja2

WORKDIR /app/

COPY log.ini .

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/run.sh"]
