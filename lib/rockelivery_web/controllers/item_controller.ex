defmodule RockeliveryWeb.ItemController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Item

  action_fallback RockeliveryWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Item{} = item} <- Rockelivery.create_item(params) do
      conn
      |> put_status(:created)
      |> render("create.json", item: item)
    end
  end
end
