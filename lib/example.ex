

defmodule Example do
  use Application


  def start(_type, _args) do
    Example.main()
    children = []
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def main do
    correct = :rand.uniform(11) -1
    IO.puts(correct)
    guess = IO.gets("Guess a number between 0 and 10: ") |> String.trim() |> Integer.parse()
    case guess do
      {result, _} ->
        IO.puts("You guessed #{result}")
        if result == correct do
          IO.puts("You guessed correctly")
        else
          IO.puts("You guessed incorrectly")
        end
    end
  end
end
