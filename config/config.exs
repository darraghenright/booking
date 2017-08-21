# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :booking,
  ecto_repos: [Booking.Repo]

# Configures the endpoint
config :booking, BookingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "4twM/xhMMYyb9B4s6VUlQ5sbEjckwCrODdRfnSCD+7mpSMKPIwd/DbSeX8Oa6RRj",
  render_errors: [view: BookingWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Booking.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
