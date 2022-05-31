defmodule RockeliveryWeb.UserControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates an user", %{conn: conn} do
      params = %{
        "age" => 19,
        "address" => "Rua A",
        "cep" => "65913180",
        "cpf" => "02319283747",
        "email" => "test@gmail.com",
        "password" => "124566",
        "name" => "Thiago"
      }

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:created)

      assert %{
        "message" => "User created",
        "user" => %{
          "address" => "Rua A",
          "age" => 19,
          "cpf" => "02319283747",
          "email" => nil,
          "id" => _id
        }
      } = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "password" => "123456",
        "name" => "Thiago"
      }

      response =
        conn
        |> post(Routes.user_path(conn, :create, params))
        |> json_response(:bad_request)

      expetected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"]
        }
      }

      assert response == expetected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "0289fdf9-e5b5-4924-8ba9-174d6db5acc3"
      insert(:user)

      response =
        conn
        |> delete(Routes.user_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
