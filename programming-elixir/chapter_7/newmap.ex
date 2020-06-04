defmodule Newmap do
    def map([],_f), do: []
    def map([x|xs],f), do: [f.(x)|map(xs,f)]
end

defmodule Newsum do
    def sum(list), do: _sum(list,0)

    defp _sum([],total), do: total
    defp _sum([x|xs],total), do: _sum(xs, x+total)
end

defmodule Newsum_ do
    def sum([]), do: 0
    def sum([x|xs]), do: x + sum(xs)
end

defmodule Newreduction do
    def reduce([],val,_f), do: val
    def reduce([x|xs],val,f), do: reduce(xs,f.(x,val),f)
end

defmodule Exercises do
    def mapsum([],_f), do: 0
    def mapsum([x|xs],f), do: f.(x) + mapsum(xs,f)

    def maximum([],val), do: val
    def maximum([x|xs],val) when x >= val, do: maximum(xs,x)
    def maximum([x|xs],val) when x < val, do: maximum(xs,val)

    def ceasar([],_n), 
        do: []
    def ceasar([x|xs],n) when x+n <= ?z,
        do: [x + n | ceasar(xs,n)]
    def ceasar([x|xs],n),
        do: [x+n-26|ceasar(xs,n)]
end
