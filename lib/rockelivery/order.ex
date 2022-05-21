defmodule Rockelivery.Order do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:address, :comments, :payment_method, :user_id]
  @payment_methods [:money, :credit_card, :debit_card]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "orders" do
    field :payment_method, Ecto.Enum, values: @payment_methods
    field :address, :string
    field :comments, :string

    many_to_many :items, Rockelivery.Item, join_through: "orders_items"
    belongs_to :user, Rockelivery.Users.User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params, items) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> put_assoc(:items, items)
    |> validate_length(:address, min: 10)
    |> validate_length(:comments, min: 10)
  end
end
