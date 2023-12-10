IO.print("Hello World!")
"aa#{1}abbb" |> IO.inspect()
Kernel.abs()
a = 1

# test
defmodule Hello do
  def test() do
    test()
  end

  defp test(p) do
  end
end
Hello.test()

require World
World.say()
