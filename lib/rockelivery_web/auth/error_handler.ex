defmodule RockeliveryWeb.Auth.ErrorHandler do
  alias Guardian.Plug.ErrorHandler

  @behaviour ErrorHandler

  def auth_error(conn, {error, _reason}, _opts) do
    body = Jason.encode!(%{message: to_string(error)})

    Plug.Conn.send_resp(conn, 401, body)
  end
end
