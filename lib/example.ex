defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

defmodule Example do
  use Application


  def start(_type, _args) do
    Example.main()
    children = []
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def main do
    gold_membership = %Membership{type: :gold, price: 10}
    silver_membership = %Membership{type: :silver, price: 5}
    bronze_membership = %Membership{type: :bronze, price: 1}
    none_membership = %Membership{type: :none, price: 0}

   users = [
    %User{name: "John", membership: gold_membership},
    %User{name: "Jane", membership: silver_membership},
    %User{name: "Jim", membership: none_membership},
    %User{name: "Jill", membership: bronze_membership},
    %User{name: "Jack", membership: gold_membership}
   ]

   Enum.each(users, fn %User{name: name, membership: membership} ->
     IO.puts("#{name} has  a #{membership.type} membership with a price of #{membership.price}")
    end)
  end

end
