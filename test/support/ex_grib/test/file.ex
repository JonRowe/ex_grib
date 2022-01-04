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

  defp process(data, [{:skip, [{:octets, n}]} | rest]), do: process(skip_bytes(n, data), rest)
  defp process(data, []), do: data

  defp skip_bytes(n, input) do
    <<_skip::binary-size(n), rest::binary()>> = input
    rest
  end
end
