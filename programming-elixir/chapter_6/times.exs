defmodule Times do
    def double(n), do: n*2
    def triple(n), do: n*3
    def quadruple(n), do: double(double(n))

    def factorial(0), do: 1
    def factorial(n) when n > 0 do
        n * factorial(n - 1)
    end

    def listsum([]), do: 0
    def listsum([x|xs]), do: x + listsum(xs)

    def listlength([]), do: 0
    def listlength([_|xs]), do: 1 + listlength(xs)

    def sumton(0), do: 0
    def sumton(n), do: n + sumton(n - 1)

    def gcd(x,0), do: x
    def gcd(x,y), do: gcd(y,rem(x,y))
end