# Minimal demo image: a static Nginx page that shows which environment
# (dev / staging / prod) it was built for. Swap this out for a real app later.

FROM nginx:alpine

ARG ENVIRONMENT=dev
LABEL environment=$ENVIRONMENT
LABEL maintainer="damssket@gmail.com"

COPY app/index.html /usr/share/nginx/html/index.html

# Bake the environment name into the page at build time
RUN sed -i "s/{{ENVIRONMENT}}/$ENVIRONMENT/g" /usr/share/nginx/html/index.html

EXPOSE 80
