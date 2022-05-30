defmodule RockeliveryWeb.OrderController do
  use RockeliveryWeb, :controller

  alias Rockelivery.Order

  action_fallback RockeliveryWeb.FallbackController

  def create(conn, params) do
    with {:ok, %Order{} = order} <- Rockelivery.create_order(params) do
      conn
      |> put_status(:created)
      |> render("create.json", order: order)
    end
  end
end
