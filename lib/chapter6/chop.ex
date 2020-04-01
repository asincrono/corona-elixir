defmodule Chop do
  def guess(target, first..last) do
    middle = middle_point(first..last)
    IO.puts("Is it #{middle}?")

    cond do
      target < middle -> guess(target, first..middle)
      target > middle -> guess(target, middle..last)
      target == middle -> target
    end
  end

  def middle_point(first..last) do
    div(last - first, 2) + first
  end

  def guess_v1(target, range) do
    do_guess(target, range, middle_point(range))
  end

  defp do_guess(target, _range, target) do
    IO.puts("Is it #{target}?")
    target
  end

  defp do_guess(target, first.._last, guessed) when target < guessed do
    IO.puts("Is it #{guessed}?")
    do_guess(target, first..guessed, middle_point(first..guessed))
  end

  defp do_guess(target, _first..last, guessed) when target > guessed do
    IO.puts("Is it #{guessed}?")
    do_guess(target, guessed..last, middle_point(guessed..last))
  end
end
