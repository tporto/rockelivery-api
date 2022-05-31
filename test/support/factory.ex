defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.Users.User

  def user_params_factory do
    %{
      "age" => 27,
      "address" => "Rua carajas",
      "cep" => "65913180",
      "cpf" => "02687626742",
      "email" => "tporto@test.com",
      "password" => "123456",
      "name" => "Thiago"
    }
  end

  def user_factory do
    %User{
      age: 27,
      address: "Rua carajas",
      cep: "65913180",
      cpf: "02687626742",
      email: "tporto@test.com",
      password: "123456",
      name: "Thiago",
      id: "0289fdf9-e5b5-4924-8ba9-174d6db5acc3"
    }
  end
end
