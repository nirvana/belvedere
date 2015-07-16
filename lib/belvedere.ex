defmodule Belvedere do
  @moduledoc """
   Belvedere is an example for continuous integration using CircleCI

   The two methods below have doctests.  Change the ! to a ? in the string for
   welcome(name) to make the tests fail.  (and see what happens with your CI)
   """

  @doc ~S"""
  Composes a personalized welcome.

  ## Examples

      iex> Belvedere.greeting "Joe"
      "Hello Joe!"

  """
  @spec greeting(String.t) :: String.t
  def greeting(name) do
    "Hello #{name}!"
  end

  @doc ~S"""
  Composes a personalized welcome.

  ## Examples

      iex> Belvedere.welcome "Joe"
      "Hello Joe!"

  """
  @spec welcome(String.t) :: String.t
  def welcome(name) do
    "Hello #{name}!"   # Make this a ? instead of ! so there's a bug here to test the test.
  end

end
