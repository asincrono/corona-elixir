defmodule Midi do
  defstruct content: <<>>

  @type t :: %__MODULE__{content: binary}
  defmodule(Frame) do
    defstruct type: "xxxx", length: 0, data: <<>>
  end

  def max(a, b) do
    if a > b do
      a
    else
      b
    end
  end
end
