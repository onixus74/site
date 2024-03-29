defmodule SiteWeb.UserController do
  use SiteWeb, :controller

  alias Site.Accounts
  alias Site.Accounts.User


  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render conn, "new.html", changeset: changeset,  scripts: ["/nim/nimcache/other.js"]
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "Signed up successfully.")
        |> redirect(to: "/")
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
