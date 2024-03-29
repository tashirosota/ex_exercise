defmodule Issues.CLI do
  @default_count 4
  @moduledoc """
  Handle the command lie parsing ando the dispatch to
  the various functions that end up generating a
  taple of the last _n_ issues in a github project
  """
  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  @doc """
  `argv` can be -h or -help, which returns :help.

  Otherwise it is a github user name, project name, and（optionally）
  the number of entries to format.
  Return a tuple of `{ user, project, count }`, or `:help` if help was given.
  """
  def parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])

    case parse do
      {[help: true], _, _} -> :help
      {_, [user, project, count], _} -> {user, project, count |> String.to_integer()}
      {_, [user, project], _} -> {user, project, @default_count}
      _ -> :help
    end
  end

  def process(:help) do
    IO.puts("""
    using: issues <user> <project> [ count | #{@default_count} ]
    """)

    System.halt(0)
  end

  def process({user, project, count}) do
    Issues.GithubIssues.fetch(user, project)
    |> decode_response
    |> convert_to_list_of_maps
    |> Enum.take(count)
  end

  def decode_response({:ok, body}), do: body

  def decode_response({:error, error}) do
    # poisonの仕様が変わったので
    # {_, message} = List.keyfind(error, "message", 0)
    IO.puts("Error fetching from Github: #{error}")
    System.halt(2)
  end

  def convert_to_list_of_maps(list) do
    list
    |> Enum.map(&Enum.into(&1, Map.new()))
  end

  def sort_into_ascending_order(list_of_issues) do
    func = &(&1["created_at"] <= &2["created_at"])
    Enum.sort(list_of_issues, func)
  end
end
