handle_open = fn
	{:ok,file} -> "first line: #{IO.read(file, :line)}"
	{_,error} -> "error: #{:file.format_error(error)}"
end

IO.puts handle_open.(File.open("somefile"))
