defmodule SiteWeb.PageController do
  use SiteWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", scripts: ["/nim/nimcache/play.js"]
  end
end
