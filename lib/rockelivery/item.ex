defmodule Rockelivery.Item do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:category, :description, :price, :photo]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "items" do
    field :category, Ecto.Enum, values: [:food, :drink, :desert]
    field :description, :string
    field :price, :decimal
    field :photo, :string

    many_to_many :orders, Rockelivery.Order, join_through: "orders_items"

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 6)
    |> validate_number(:price, greater_than: 0)
  end
end
