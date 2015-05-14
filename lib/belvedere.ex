defmodule Belvedere do

  @doc ~S"""
  Composes a personalized welcome.

  ## Examples

      iex> Belvedere.greeting "Joe"
      "Hello Joe!"

  """
  def greeting(name) do
    "Hello #{name}!"
  end

  @doc ~S"""
  Composes a personalized welcome.

  ## Examples

      iex> Belvedere.welcome "Joe"
      "Hello Joe!"

  """
  def welcome(name) do
    "Hello #{name}?"   # There's a bug here to test the test.
  end

end
