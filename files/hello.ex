IO.print("Hello World!")
"aa#{1}abbb" |> IO.inspect()
Kernel.abs()

# test
defmodule Hello do
  def test() do
    test()
  end

  defp test() do
  end
end
Hello.test()

require World
World.say()
