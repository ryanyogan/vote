defmodule Candidate do
  defstruct [:id, :name, votes: 0]

  @spec new(number(), binary()) :: %Candidate{id: number(), name: binary(), votes: number()}
  def new(id, name) do
    __struct__(id: id, name: name)
  end
end
