defmodule Numberguess do
    def main(secret, x..y) do
        if not (secret in x..y) do
            raise IO.puts "Value error: secret must be in range."
        end
        avg = &(div(&1+&2,2))
        new_guess = avg.(x,y)
        "Is it #{new_guess}?" |> IO.puts()
        take_guess(new_guess,secret,x..y)
    end
    # take_guess -> guess -> secret -> range -> result
    defp take_guess(secret,secret,_), do: "Success: secret is #{secret}" |> IO.puts()
    
    defp take_guess(guess,secret,x..y) when guess > secret,
        do: main(secret,x..guess-1)

    defp take_guess(guess,secret,_x..y) when guess < secret, 
        do: main(secret,guess+1..y)
end