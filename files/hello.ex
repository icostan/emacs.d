IO.print("Hello World!")
"aa#{1}abbb" |> IO.inspect()
Kernel.abs()

defmodule Hello do
  def test() do
    testp()
  end

  defp testp() do
  end
end
Hello.test()

require World
World.say()
