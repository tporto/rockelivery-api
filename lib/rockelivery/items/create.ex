defmodule Rockelivery.Items.Create do
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.Item

  def call(params) do
    params
    |> Item.changeset()
    |> Repo.insert()
    |> handle()
  end

  defp handle({:ok, %Item{}} = result), do: result

  defp handle({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
