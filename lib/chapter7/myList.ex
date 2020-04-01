defmodule MyList do
  def mapsum(list, func) do
    Enum.reduce(list, fn elem, acc -> acc + func.(elem) end)
  end

  def max([]), do: nil

  def max([h | _t] = list) when is_list(list) do
    do_max(list, h)
  end

  defp do_max([], current), do: current

  defp do_max([h | t], current) when h > current do
    do_max(t, h)
  end

  defp do_max([_h | t], current), do: do_max(t, current)

  def caesar(l, n) when is_list(l) and is_integer(n) do
    do_caesar(l, n, [])
    |> Enum.reverse()
  end

  defp do_caesar([], _n, message), do: message

  defp do_caesar([h | t], n, message) do
    IO.puts(h)
    c = h + n
    c = if c > 122, do: 97 + rem(c, 123), else: c

    do_caesar(t, n, [c | message])
  end

  def span(from, to, list \\ [])
  def span(to, to, list), do: [to | list]

  def span(from, to, list) when from < to do
    span(from, to - 1, [to | list])
  end

  def span(from, to, list) when from > to do
    span(from, to + 1, [to | list])
  end

  def span_v1(from, to), do: for(value <- from..to, do: value)
end
