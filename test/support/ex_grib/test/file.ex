defmodule ExGrib.Test.File do
  @folder Path.expand("../../files", __DIR__)

  def filename(file), do: Path.join(@folder, file)

  def file_contents(file) do
    file
    |> filename()
    |> File.read!()
  end

  def file_stream(file) do
    file
    |> filename()
    |> File.stream!()
  end
end
