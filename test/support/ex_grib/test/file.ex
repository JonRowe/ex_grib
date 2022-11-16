defmodule ExGrib.Test.File do
  @folder Path.expand("../../files", __DIR__)

  def filename(file), do: Path.join(@folder, file)

  def file_contents(file, opts \\ []) do
    file
    |> filename()
    |> File.read!()
    |> process(opts)
  end

  def file_stream(file, opts \\ []) do
    file
    |> filename()
    |> File.stream!()
    |> process(opts)
  end

  defp process(data, [{:parse, :csv}]) do
    data
    |> String.split("\n", trim: true)
    |> Enum.map(&read_csv_line/1)
  end

  defp process(_, [{:parse, :csv} | _]),
    do: raise(ArgumentError, "Combining csv parsing with anything else is not supported")

  defp process(data, [{:skip, [{:octets, n}]} | rest]), do: process(skip_bytes(n, data), rest)
  defp process(data, []), do: data

  defp skip_bytes(n, input) do
    <<_skip::binary-size(n), rest::binary()>> = input
    rest
  end

  defp read_csv_line(line) do
    line
    |> String.split(",")
    |> Enum.map(fn element ->
      cond do
        element =~ ~r/".*"/ ->
          String.trim(element, "\"")

        element =~ ~r/-?\d+\.\d+/ ->
          {value, ""} = Float.parse(element)
          value

        true ->
          raise ArgumentError, "Unexpected value in parsing csv #{inspect(element)}"
      end
    end)
  end
end
