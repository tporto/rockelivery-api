defmodule RockeliveryWeb.UserController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Users.User

  action_fallback RockeliveryWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rockelivery.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def update(conn, params) do
    with {:ok, %User{} = user} <- Rockelivery.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("usercreate.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Rockelivery.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Rockelivery.get_user_by_id(id) do
      conn
      |> put_status(:created)
      |> render("user.json", user: user)
    end
  end
end
