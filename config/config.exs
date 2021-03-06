# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :parking, ecto_repos: [Parking.Repo]

# Configures the endpoint
config :parking, ParkingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "c5Bf21J1oPKq1sdR1KBtafNkwAVnX6FiUpAy2KXStANCAyxVouBbyqithc6qA/eA",
  render_errors: [view: ParkingWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Parking.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :parking, Parking.Auth.Guardian,
  issuer: "parking",
  secret_key: "Owyg9XBjbpKF52Wk8UeGmkopkjI8vAkKmkUlXAhedMPGsHNP4x5gsdbBjdyavk9M"
