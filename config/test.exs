use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :site, SiteWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :site, Site.Repo,
adapter: Ecto.Adapters.Postgres,
username: "postgres",
password: "postgres",
database: "site_dev",
hostname: "dev",
pool_size: 10,
pool: Ecto.Adapters.SQL.Sandbox
