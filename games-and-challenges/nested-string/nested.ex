defmodule Nested do

  def is_correctly_nested?(""), do: true
  def is_correctly_nested(str) do
    cond do
      is_valid?(str) ->
        case remove_pairs(str) do
          "" -> true
          _ -> false
        end
      true -> false
    end
  end

  def remove_pairs(""), do: ""
  def remove_pairs(str) do
    case has_pair?(str) do
      true ->
        str_ = str
        |> String.replace("()","")
        |> String.replace("[]","")
        |> String.replace("{}","")
        remove_pairs(str_)
      false -> str
    end
  end

  defp allowed_characters, do: ["(",")","[","]","{","}",""]
  defp is_valid?(str) do
      str_ = String.split(str,"")
      Enum.all?(str_, &(&1 in allowed_characters()))
  end
  defp has_pair?(str) do
    String.match?(str, ~r/{}/) or
    String.match?(str, ~r/\[\]/) or
    String.match?(str, ~r/\(\)/)
  end
end
