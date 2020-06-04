defmodule Swapper do
    def swap([]), do: []
    def swap([a, b | tail]), do: [b, a| swap(tail)]
    def swap([_]), do: raise "Can't swap a list of odd numbers."
end

defmodule WeatherHistory do
    #[timestamp,location_id,temperature,rainfall]
    def for_location([],_target_loc), 
        do: []
    def for_location([x = [_,target_loc,_,_]|xs],target_loc),
        do: [x| for_location(xs,target_loc)]
    def for_location([_|xs],target_loc), 
        do: for_location(xs,target_loc)
    
    def test_data, 
        do: [
            [123141356,26,15,0.123],
            [769654356,27,15,0.65],
            [968574634,27,15,0.25],
            [645746533,22,15,0.953],
            [856752344,27,15,0.953],
        ]
end

defmodule Exercises do
    def span(from,to) when from > to,
        do: []
    def span(from, to), 
        do: [from|span(from+1,to)]
end