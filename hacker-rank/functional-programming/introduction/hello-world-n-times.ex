defmodule Solution do
#Enter your code here. Read input from STDIN. Print output to STDOUT
    def get_input do
        IO.gets("Input here: ")
        |> String.trim
        |> String.to_integer()
    end

    def f(x) do
        Enum.each(1..x, fn y -> IO.puts("Hello World") end)
    end
  end
