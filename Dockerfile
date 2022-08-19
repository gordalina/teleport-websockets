FROM elixir:1.13-alpine as build

ENV MIX_ENV=prod
WORKDIR /app

RUN mix do local.hex --force, local.rebar --force

# Cache elixir deps
COPY mix.exs mix.lock /app/
RUN mix deps.get --only=$MIX_ENV

COPY . ./
RUN mix release

FROM elixir:1.13-alpine as runtime

ENV MIX_ENV=prod
WORKDIR /app

COPY --from=build /app/_build/$MIX_ENV/rel/teleport_websockets /app
RUN chown -R nobody:nobody /app

USER nobody:nobody
ENV HOME=/app

ENTRYPOINT [ "/app/bin/teleport_websockets", "start" ]
EXPOSE 4000
