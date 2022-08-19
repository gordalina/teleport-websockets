import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :teleport_websockets, TeleportWebsocketsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "8JvJrClggOK11RGKR7qoX2VtIOldtmg4uIbYXtfA0iBzAmBqYSCZcTssGL9sNufx",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
