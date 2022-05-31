defmodule Rockelivery.Users.CreateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.Error
  alias Rockelivery.Users.{Create, User}

  describe "create/1" do
    test "when all params are valid, returns the user" do
      params = build(:user_params)

      response = Create.call(params)

      assert {:ok, %User{id: _id, name: "Thiago"}} = response
    end

    test "when there are invalid params, returns an error" do
      params = build(:user_params, %{"password" => "123", "age" => 15})

      response = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
