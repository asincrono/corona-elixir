defmodule Sum do
  def sum(0), do: 0
  def sum(n), do: n + sum(n - 1)

  @doc """
  Suma de forma recursiva los números de n a 0 optimizando para tener en cuenta Call Tail Optimization
  """
  def sum_ct(n) do
    do_sum_ct(n, 0)
  end

  defp do_sum_ct(0, acc), do: acc
  defp do_sum_ct(n, acc), do: do_sum_ct(n - 1, acc + n)

  def gcd(x, 0), do: x
  def gcd(x, y), do: gcd(y, rem(x, y))
end
