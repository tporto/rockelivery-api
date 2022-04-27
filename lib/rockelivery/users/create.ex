defmodule Rockelivery.Users.Create do
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.Users.User

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle()
  end

  defp handle({:ok, %User{}} = result), do: result

  defp handle({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
