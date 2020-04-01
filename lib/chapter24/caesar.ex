defprotocol Caesar do
  def encrypt(string, shift)
  def rot13(string)
end

defimpl Caesar, for: List do
  def encrypt(list, shift) do
    len = length(list)

    shift =
      if shift > len do
        len - rem(shift, len)
      else
        len - shift
      end

    {l_l, l_r} = Enum.split(list, shift)
    l_r ++ l_l
  end

  def rot13(list), do: encrypt(list, 13)

  defimpl Caesar, for: BitString do
    def encrypt(bin, shift) do
      len = div(bit_size(bin), 8)

      shift =
        if shift > len do
          len - rem(shift, len)
        else
          len - shift
        end

      bit_size = shift * 8
      IO.puts("bit size: #{bit_size}")
      <<b_l::size(bit_size), b_r::binary>> = bin
      IO.puts("b_l: #{b_l}, b_r: #{b_r}")
      b_r <> <<b_l::size(bit_size)>>
    end

    def rot13(bin), do: encrypt(bin, 13)
  end
end
