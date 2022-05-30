defmodule Rockelivery.Orders.Report do
  import Ecto.Query

  alias Rockelivery.{Item, Order}
  alias Rockelivery.Orders.TotalPrice
  alias Rockelivery.Repo

  @default_block_size 500

  def create(filename \\ "report.csv") do
    query = from order in Order, order_by: order.user_id

    {:ok, order_list} =
      Repo.transaction(
        fn ->
          query
          |> Repo.stream(max_rows: @default_block_size)
          |> Stream.chunk_every(@default_block_size)
          |> Stream.flat_map(fn chunk -> Repo.preload(chunk, :items) end)
          |> Enum.map(&parse_line/1)
        end,
        timeout: :infinity
      )

    File.write(filename, order_list)
  end

  defp parse_line(%Order{} = order) do
    total_price = TotalPrice.calculate(order.items)
    items_string = Enum.map(order.items, &item_string/1)

    "#{order.user_id},#{order.payment_method},#{items_string},#{total_price}\n"
  end

  defp item_string(%Item{} = item) do
    "#{item.category},#{item.description},#{item.price},"
  end
end
