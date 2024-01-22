FROM nginx:1.23.3-alpine as build

LABEL name="mfe-app-a" \
      description="Micro-Frontend application using angular, module federation and Single-SPA"

COPY nginx /etc/nginx

RUN touch ./off \
  && chmod o+rw ./off \
  && echo "mfe-app-a: $COMMIT_SHA" >> /etc/nginx/commit.sha

WORKDIR /usr/static

COPY ./dist .

USER nginx
