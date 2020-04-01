defmodule First do
  @moduledoc """
  Documentation for First.
  """

  import Kernel, except: [+: 2, -: 2]

  @doc """
  Hello world.

  ## Examples

      iex> First.hello()
      :world

  """
  def hello() do
    :world
  end

  def world(a, b) do
    a + b
  end

  def español do
    "a qué quieres que te gane"
  end

  def checkZeroes(0, 0, _), do: IO.puts("FizzBuzz")
  def checkZeroes(0, _, _), do: IO.puts("Fizz")
  def checkZeroes(_, 0, _), do: IO.puts("Buzz")
  def checkZeroes(_, _, x), do: IO.puts(x)

  def wtf1(n), do: checkZeroes(rem(n, 3), rem(n, 5), n)

  def prefix(str) do
    fn str2 -> "#{str2} #{str}" end
  end

  def redoMap(l) do
    Enum.map(l, &(&1 + 2))
  end

  def redoEach(l) do
    Enum.each(l, &IO.inspect(&1))
  end

  def factorial(n, acc \\ 1)

  def factorial(0, acc), do: acc

  def factorial(n, acc) do
    factorial(n - 1, n * acc)
  end

  def sum(n, acc \\ 0)
  def sum(0, acc), do: acc

  def sum(n, acc) do
    sum(n - 1, n + acc)
  end

  def gdc(x, 0), do: x
  def gdc(x, y), do: gdc(y, rem(x, y))

  def guess(actual, actual.._), do: actual
  def guess(actual, _..actual), do: actual

  def guess(actual, first..last) when actual >= first and actual <= last do
    m = mid_point(first..last)

    if actual < m do
      guess(actual, first..m)
    else
      guess(actual, m..last)
    end
  end

  def guess(actual, first..last), do: "#{actual} is not in #{first}..#{last}"

  def mid_point(first..last) do
    first + div(last - first, 2)
  end

  def slide_bead(str) do
    {graph, rest} = String.next_grapheme(str)
    rest <> graph
  end

  def get_rotations(str) do
    do_get_rotations(str, String.length(str), [])
  end

  defp do_get_rotations(_, 0, rotations), do: rotations

  defp do_get_rotations(str, iter, rotations) do
    do_get_rotations(slide_bead(str), iter - 1, [str | rotations])
  end

  def same_necklance?(str, str), do: true

  def same_necklance?(l_str, r_str) do
    l_str in get_rotations(r_str)
  end

  def same_necklance(str, str), do: true

  def same_necklance(l_str, r_str) do
    if String.length(l_str) != String.length(r_str) do
      false
    else
      do_same_necklance(l_str, r_str, String.length(l_str))
    end
  end

  defp do_same_necklance(str, str, _), do: true
  defp do_same_necklance(_, _, 0), do: false

  defp do_same_necklance(l_str, r_str, n) do
    do_same_necklance(l_str, slide_bead(r_str), n - 1)
  end

  def range_length(first..last) do
    abs(first - last) + 1
  end

  def a + b when is_bitstring(a) and is_bitstring(b), do: a <> b
  def a + b, do: Kernel.+(a, b)

  def a - b when is_bitstring(a) and is_bitstring(b), do: String.replace(a, b, "")
  def a - b, do: Kernel.-(a, b)

  def len(l) when is_list(l) do
    do_len(l, 0)
  end

  defp do_len([], l), do: l

  defp do_len([_ | t], l) do
    do_len(t, l + 1)
  end

  def squared(l) when is_list(l) do
    do_squared(l, [])
    |> Enum.reverse()
  end

  defp do_squared([], l_squared), do: l_squared

  defp do_squared([h | t], l_squared) do
    do_squared(t, [h * h | l_squared])
  end

  def mapsum(l, f) when is_list(l) do
    do_mapsum(l, f, 0)
  end

  defp do_mapsum([], _f, sum), do: sum
  defp do_mapsum([h | t], f, sum), do: do_mapsum(t, f, sum + f.(h))

  def max(l) when is_list(l) do
    do_max(l, 0)
  end

  defp do_max([], max), do: max
  defp do_max([h | t], max), do: do_max(t, max(h, max))

  def span(from, to) when from <= to do
    do_span(from, to, []) |> Enum.reverse()
  end

  defp do_span(to, to, list), do: [to | list]

  defp do_span(from, to, list) do
    do_span(from + 1, to, [from | list])
  end

  @doc """
  Suma los números de hasta `x`.
  Ejemplo:
    iex> First.suma_r(3)
    6
  """
  def suma_r(0), do: 1
  def suma_r(x), do: 1 + suma_r(x - 1)

  def prime?(1), do: true
  def prime?(2), do: true

  def prime?(x) do
    length(for y <- (x - 1)..2, rem(x, y) == 0, do: y) == 0
  end

  @doc """
  Devuelve los números primos entre 1 y n
  """
  def get_primes(1), do: [1]

  def get_primes(n) do
    for x <- 1..n, length(for y <- 1..n, rem(x, y) == 0, do: y) <= 2, do: x
  end

  def process_collection() do
    orders = [
      [id: 123, ship_to: :NC, net_amount: 100.00],
      [id: 124, ship_to: :OK, net_amount: 35.50],
      [id: 125, ship_to: :TX, net_amount: 24.00],
      [id: 126, ship_to: :TX, net_amount: 44.80],
      [id: 127, ship_to: :NC, net_amount: 25.00],
      [id: 128, ship_to: :MA, net_amount: 10.00],
      [id: 129, ship_to: :CA, net_amount: 102.00],
      [id: 130, ship_to: :NC, net_amount: 50.00]
    ]

    tax_rates = [NC: 0.075, TX: 0.08]

    for [_id, {:ship_to, o_destination}, {:net_amount, amount}] = order <- orders,
        {t_destination, tax} <- tax_rates,
        o_destination == t_destination do
      [{:total_amount, amount + amount * tax} | order]
    end
  end

  def is_ascii?(char_list) do
    do_is_ascii?(char_list)
  end

  defp do_is_ascii?([]), do: true

  defp do_is_ascii?([char | t]) when char >= ?\s and char <= ?´ do
    do_is_ascii?(t)
  end

  defp do_is_ascii?(_), do: false

  def anagram?(w1, w2) when is_list(w1) and is_list(w2) do
    if length(w1) == length(w2) do
      do_anagram?(w1, w2)
    else
      false
    end
  end

  defp do_anagram?([], _), do: true

  defp do_anagram?([char | tail], w2) do
    if char in w2 do
      do_anagram?(tail, w2)
    else
      false
    end
  end

  def calc(calc_str) do
    do_calc(calc_str, 0, 0)
  end

  defp do_calc(calc_str, n1, n2, op \\ nil)

  defp do_calc([], n1, n2, op) do
    case op do
      ?+ ->
        n1 + n2

      ?- ->
        n1 - n2

      ?* ->
        n1 * n2

      ?/ ->
        n1 / n2

      _error ->
        nil
    end
  end

  defp do_calc([?+ | calc_str], n1, n2, _op) do
    do_calc(calc_str, n1, n2, ?+)
  end

  defp do_calc([?- | calc_str], n1, n2, _op) do
    do_calc(calc_str, n1, n2, ?-)
  end

  defp do_calc([?* | calc_str], n1, n2, _op) do
    do_calc(calc_str, n1, n2, ?*)
  end

  defp do_calc([?/ | calc_str], n1, n2, _op) do
    do_calc(calc_str, n1, n2, ?/)
  end

  defp do_calc([?\s | calc_str], n1, n2, op) do
    do_calc(calc_str, n1, n2, op)
  end

  defp do_calc([char | calc_str], n1, n2, op) when is_nil(op) do
    do_calc(calc_str, char_to_int(char) + n1 * 10, n2, op)
  end

  defp do_calc([char | calc_str], n1, n2, op) do
    do_calc(calc_str, n1, char_to_int(char) + n2 * 10, op)
  end

  def char_to_int(char) when char >= ?0 and char <= ?9 do
    char - ?0
  end

  @spec get_pad_length(integer, integer) :: binary | number
  def get_pad_length(big_l, small_l) when is_integer(big_l) and is_integer(small_l),
    do: div(big_l, 2) + div(small_l, 2)

  def get_max_length(word_list) do
    Enum.reduce(word_list, 0, fn word, acc -> max(String.length(word), acc) end)
  end

  def print_centered([], _max_length), do: IO.puts("fin de la lista")

  def print_centered([word | word_list], max_length) do
    pad_length = get_pad_length(max_length, String.length(word))
    IO.puts(String.pad_leading(word, pad_length, " "))
    print_centered(word_list, max_length)
  end

  def capital(words_str) when is_binary(words_str) do
    String.split(words_str, ". ") |> do_capital([])
  end

  defp do_capital([], list), do: Enum.reverse(list)
  defp do_capital([word | []], list), do: [String.capitalize(word) | list]

  defp do_capital([word | rest], list) do
    do_capital(rest, [String.capitalize(word) <> "." | list])
  end

  def taxes_file!(file_path) do
    File.open!(file_path)
    |> file_to_lines([])
    |> split_header_lines()
    |> header_to_keys()
    |> assign_keys_values()
    |> parse_data()
  end

  def file_to_lines(file, list, line \\ [])
  def file_to_lines(_file, list, :eof), do: Enum.reverse(list)

  def file_to_lines(file, list, []) do
    file_to_lines(file, list, IO.read(file, :line))
  end

  def file_to_lines(file, list, line) do
    file_to_lines(file, [line | list], IO.read(file, :line))
  end

  def header_to_keys({header, lines}) do
    keys =
      String.trim_trailing(header)
      |> String.split(",")

    {keys, lines}
  end

  def split_header_lines([header | lines]) do
    {header, lines}
  end

  def line_to_values(line) do
    String.trim_trailing(line)
    |> String.split(",")
  end

  def assign_keys_values({keys, lines}) do
    for line <- lines do
      do_assign_keys_values(keys, line_to_values(line), [])
    end
  end

  defp do_assign_keys_values([], [], list), do: Enum.reverse(list)

  defp do_assign_keys_values([key | keys], [value | values], list) do
    do_assign_keys_values(keys, values, [
      {:"#{key}", value} | list
    ])
  end

  def parse_data(list) do
    do_parse_data(list, [])
  end

  defp do_parse_data([], list), do: Enum.reverse(list)

  defp do_parse_data([[{:id, s_id}, ship_to, {:net_amount, s_n_a}] | t], list) do
    do_parse_data(t, [
      [{:id, String.to_integer(s_id)}, ship_to, {:net_amount, String.to_float(s_n_a)}] | list
    ])
  end

  def to_number(string) do
    cond do
      Regex.match?(~r/^([1-9]\d+|0)\.\d+$/, string) ->
        IO.puts("float")
        {:ok, String.to_float(string)}

      Regex.match?(~r/^\d+$/, string) ->
        IO.puts("integer")
        {:ok, String.to_integer(string)}

      true ->
        {:error, string}
    end
  end

  def caesar(list, 0), do: list

  def caesar(list, shift) do
    len = length(list)

    shift =
      if shift > len do
        len - rem(shift, len)
      else
        len - shift
      end

    {l_l, l_r} = Enum.split(list, shift)
    l_r ++ l_l
    # caesar(shift(list), shift - 1)
  end

  defp shift(list) when is_list(list) do
    [h | t] = Enum.reverse(list)
    Enum.reverse(t ++ [h])
  end
end
