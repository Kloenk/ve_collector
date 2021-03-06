# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ve_collector,
  ecto_repos: [VeCollector.Repo]

config :ve_collector, :admin_user,
  email: "admin@example.com",
  password: "admin12345"

# Configures the endpoint
config :ve_collector, VeCollectorWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "0/Eo4SX+KUHSoPYsswc5NJPbUntzbdDUOprRv27d2L8ct8kNXhxVr6JGdNuIbhGW",
  render_errors: [view: VeCollectorWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: VeCollector.PubSub,
  live_view: [signing_salt: "DuI+dF7t"]

# Configures pow
config :ve_collector, :pow,
  user: VeCollector.Users.User,
  repo: VeCollector.Repo,
  web_module: VeCollectorWeb,
  extensions: [PowPersistentSession]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
