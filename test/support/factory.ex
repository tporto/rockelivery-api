defmodule Rockelivery.Factory do
  use ExMachina

  def user_params_factory do
    %{
      age: 27,
      address: "Rua carajas",
      cep: "65913180",
      cpf: "02687626742",
      email: "tporto@test.com",
      password: "123456",
      name: "Thiago"
    }
  end
end
