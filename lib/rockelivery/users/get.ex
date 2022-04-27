defmodule Rockelivery.Users.Get do
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.Users.User

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found()}
      user -> {:ok, user}
    end
  end
end
