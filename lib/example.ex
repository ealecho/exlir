
require Integer
defmodule Example do
  use Application


  def start(_type, _args) do
    Example.main()
    children = []
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def main do
    grades = [25, 50, 75, 100]
    # for n <- grades do
    #   IO.puts("Grade #{n}")
    # end
    new = for n <- grades, do: n / 5
    IO.inspect(new)
    new = new ++ [125]
    final = new ++ [150]
    IO.inspect(final)
    even = for n <- final, Integer.is_even(n), do: n
    IO.inspect(even)
  end
end
