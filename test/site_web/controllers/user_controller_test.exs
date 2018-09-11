defmodule SiteWeb.UserControllerTest do
  use SiteWeb.ConnCase

  alias Site.Accounts

  @create_attrs %{encrypted_password: "some encrypted_password", username: "some username"}
  @update_attrs %{encrypted_password: "some updated encrypted_password", username: "some updated username"}
  @invalid_attrs %{encrypted_password: nil, username: nil}

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end


  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get conn, user_path(conn, :new)
      assert html_response(conn, 200) =~ "Sign Up"
    end
  end



  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end
