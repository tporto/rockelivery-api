defmodule RockeliveryWeb.UserViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias Rockelivery.Users.User
  alias RockeliveryWeb.UserView

  test "renders create.json" do
    user = build(:user)

    response = render(UserView, "create.json", user)

    assert %{
      message: "User created",
      user: %User{
        age: 27,
        address: "Rua carajas",
        cep: "65913180",
        cpf: "02687626742",
        email: "tporto@test.com",
        password: "123456",
        name: "Thiago",
        id: "0289fdf9-e5b5-4924-8ba9-174d6db5acc3"
      }
    } = response
  end
end
