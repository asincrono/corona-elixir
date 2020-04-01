defmodule ListsAndRecursion do
  def all?(list, function) do
    do_all?(list, function, true)
  end

  defp do_all?([], _function, result), do: result
  defp do_all?(_list, _function, false), do: false

  defp do_all?([h | t], function, true) do
    do_all?(t, function, function.(h))
  end

  def each([], _function), do: :ok

  def each([h | t], function) do
    function.(h)
    each(t, function)
  end

  def filter(list, function) do
    do_filter(list, function, [])
  end

  defp do_filter([], _function, result), do: Enum.reverse(result)

  defp do_filter([h | t], function, result) do
    if function.(h) do
      do_filter(t, function, [h | result])
    else
      do_filter(t, function, result)
    end
  end

  def split(list, pos) do
    do_split(list, pos, [])
  end

  defp do_split(list, pos, []) when is_list(list) and pos < 0 do
    do_split(list, length(list) + pos, [])
  end

  defp do_split(list, 0, l_aux), do: {Enum.reverse(l_aux), list}

  defp do_split([h | t], pos, l_aux) do
    do_split(t, pos - 1, [h | l_aux])
  end

  def flatten(list) do
    Enum.reverse(do_flatten(list, []))
  end

  defp do_flatten([], result), do: result

  defp do_flatten([h | t], result) when is_list(h) do
    do_flatten(t, do_flatten(h, result))
  end

  defp do_flatten([h | t], result) do
    do_flatten(t, [h | result])
  end
end
