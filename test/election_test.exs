defmodule ElectionTest do
  use ExUnit.Case
  doctest Election

  setup do
    %{election: %Election{}}
  end

  test "updating of an election name from a command", %{election: election} do
    command = "name Will Ferrell"
    election = Election.update(election, command)

    assert election == %Election{name: "Will Ferrell"}
  end

  test "adding a new candidate from a command", %{election: election} do
    command = "add Bill Murray"
    election = Election.update(election, command)

    assert election == %Election{
             candidates: [%Candidate{id: 1, name: "Bill Murray", votes: 0}],
             next_id: 2
           }
  end

  test "voting for a candidate from a command", %{election: election} do
    command = "vote 1"

    election =
      election
      |> Election.update("add Bill Murray")
      |> Election.update(command)

    assert election == %Election{
             candidates: [%Candidate{id: 1, name: "Bill Murray", votes: 1}],
             next_id: 2
           }
  end

  test "invalid command", %{election: election} do
    command = "foobar"
    election = Election.update(election, command)

    assert election == %Election{}
  end

  test "quitting the application", %{election: election} do
    command = "q"
    election = Election.update(election, command)

    assert election == :quit
  end
end
