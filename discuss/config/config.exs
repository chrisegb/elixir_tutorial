# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :discuss,
  ecto_repos: [Discuss.Repo]

# Configures the endpoint
config :discuss, Discuss.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "k7ZSxRMNhdoSxxuZ+C3g+jZl4iQDj/vFqrpx8OcmxxBahSyINLPMRRpG/8Hur8I7",
  render_errors: [view: Discuss.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Discuss.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth,
	providers: [
		github: { Ueberauth.Strategy.Github, [default_scope: "user, user:email"] }
	]

config :ueberauth, Ueberauth.Strategy.Github.OAuth,
	client_id: "ad53fd0d8fdb4d156e32",
	client_secret: "76f275054f473f82a16f8e35c8846aec9a493e1a"