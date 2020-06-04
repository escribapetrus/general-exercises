defmodule Mod do
    def func1 do
        IO.puts "in func 1"
    end
    def func2 do
        IO.puts "in func 2"
    end
end

defmodule Outer do
    defmodule Inner do
        def inner_func do
            IO.puts "Inner func"
        end
    end

    def outer_func do
        Inner.inner_func
    end
end

defmodule Example do
    def func1 do
        List.flatten [1,[2,3],4]
    end

    def func2 do
        import List, only: [flatten: 1]
        flatten [1,[2,3],4]
    end
end

# defmodule Example_two do
#     def compile_and_go(source) do
#         # alias My.Other.Module.Parser, as: Parser
#         # alias My.Other.Module.Runner, as: Runner
#         alias My.Other.Module.{Parser,Runner}
#         source |> Parser.parse() |> Runner.execute()
#     end
# end

defmodule Ex_attibutes do
    @author "Dave Thomas"
    def get_author, do: @author |> IO.puts
end

defmodule Example_attributes_2 do
    @attr "one"
    def first, do: @attr
    @attr "two"
    def second, do: @attr
end