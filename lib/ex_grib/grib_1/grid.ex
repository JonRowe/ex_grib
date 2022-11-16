defprotocol ExGrib.Grib1.Grid do
  @doc "Returns a latitude for a grid at an index."
  @spec latitude(t(), integer()) :: integer()
  def latitude(grid, index)

  @doc "Returns a longitude for a grid at an index."
  @spec longitude(t(), integer()) :: integer()
  def longitude(grid, index)
end
