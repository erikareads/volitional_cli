defmodule VolitionalCli do
  @moduledoc """
  Documentation for `VolitionalCli`.
  """

  defmodule Volitional do
    defstruct [:idea, :why, :rank]
  end

  def main(args) do
    IO.puts("======ideas======")
    ideas = get_ideas()
    IO.write("\n\n")
    IO.puts("======why======")
    volitionals = Enum.map(ideas, &get_why/1)
    IO.write("\n\n")
    IO.puts("======ranking======")
    volitionals = Enum.map(volitionals, &get_ranking/1) |> Enum.sort_by(&Map.get(&1, :rank))

    IO.write("\n\n")
    IO.puts("=========volitional muscles result=========")

    volitionals
    |> Enum.map(fn %{idea: idea, why: why, rank: rank} ->
      "rank: #{rank} - idea: #{idea} - why: #{why}"
    end)
    |> Enum.each(&IO.puts/1)
  end

  defp print_ideas(ideas) do
    ideas |> Enum.join("\n") |> IO.puts()
  end

  def get_ideas do
    get_ideas([])
  end

  def get_ideas(["done" <> _ | buffer]) do
    Enum.reverse(buffer)
  end

  def get_ideas(buffer) do
    idea = IO.gets("idea> ") |> String.trim_trailing()
    get_ideas([idea | buffer])
  end

  def get_why(idea) do
    IO.puts("idea - #{idea}")
    why = IO.gets("why> ") |> String.trim_trailing()
    %Volitional{idea: idea, why: why}
  end

  def get_ranking(volitional) do
    %Volitional{idea: idea, why: why} = volitional

    IO.puts("Rank this idea with an integer")
    IO.puts("#{idea} - #{why}")
    {rank, "\n"} = IO.gets("rank> ") |> Integer.parse()
    %Volitional{volitional | rank: rank}
  end
end
