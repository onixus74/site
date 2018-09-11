# Go Beyond Five Minutes Site

[![Build Status](https://dev.azure.com/gophersnacks/gophersnacks/_apis/build/status/gophersnacks.site)

# Setup Elixir and Phoenix

These commands were used to install Elixir and dependencies, on 
Mac OS X with Homebrew:

```console
$ brew install elixir
```

This command installs Elixir, 
[`mix`](https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html) (build tool), and various other things.

# Create ths repository

These were the commands used to set up this repository, taken
from 
[hexdocs.pm/phoenix/up_and_running.html#content](https://hexdocs.pm/phoenix/up_and_running.html#content):

```console
$ mix phx.new site
$ cd site
$ mix ecto.create
```

# Development

# To Set up The Elixir Tools

On Mac OS X with Homebrew

```console
$ brew install elixir
```

# To Set up the App

Using [these instructions](https://hexdocs.pm/phoenix/up_and_running.html#content):

```console
$ mix phx.new site
$ cd site
$ docker-compose -p site up -d dev
$ mix ecto.create
```

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

