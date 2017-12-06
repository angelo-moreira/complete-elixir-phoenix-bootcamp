# docker build -t discuss-prod -f Dockerfile-Build .
# docker container run -it discuss-prod
# docker exec -it discuss-prod sh

FROM designone-prod-stage as build

COPY discuss/ .
RUN mix deps.get && mix compile && mix release.init && mix release && mix phoenix.digest

# ------------------------------------------

FROM designone-prod-build
#Copy and extract .tar.gz Release file from the previous stage
COPY --from=build /build/_build/prod/rel/discuss/ .

EXPOSE 80

# ENTRYPOINT ["/app/bin/discuss"]
# CMD ["foreground"]

# mix phoenix.digest