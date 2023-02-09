defmodule World do
  @spec say(binary()) :: term()
  def say(message) do
    # comment bad
    IO.inspect(message)
  end
end
