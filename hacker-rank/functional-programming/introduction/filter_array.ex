defmodule FilterArray do

  def sum_array([]), do: 0
  def sum_array([x|xs]) do
    IO.puts(x)
    x + sum_array(xs)
  end

  def filter_array([], _), do: []
  def filter_array([x|xs], fun) do
    case fun.(x) do
      true -> [x|filter_array(xs, fun)]
      false -> filter_array(xs, fun)
    end
  end

end
