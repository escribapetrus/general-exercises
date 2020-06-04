#fizzbuzz w/ no conditionals

fizzbuzz = fn
	(0,0,_) -> "FizzBuzz"
	(0,_,_) -> "Fizz"
	(_,0,_) -> "Buzz"
	(_,_,c) -> c
end
	
IO.puts fizzbuzz.(0,0,0)
IO.puts fizzbuzz.(0,0,1)
IO.puts fizzbuzz.(0,1,1)
IO.puts fizzbuzz.(1,0,1)
IO.puts fizzbuzz.(1,1,1)

IO.puts "######################"

fb_ = fn n -> fizzbuzz.(rem(n,3),rem(n,5),n) |> IO.puts() end

Enum.map(10..17,fb_)
