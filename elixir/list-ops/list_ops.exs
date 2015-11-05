defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    _count(l)
  end

  defp _count([]), do: 0
  defp _count([head|tail]), do: 1 + _count(tail)

  @spec reverse(list) :: list
  def reverse(l) do
    _reverse(l, [])
  end

  defp _reverse([], x), do: x
  defp _reverse([head | tail], acc), do: _reverse(tail, [head | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    _map(l, f)
  end

  defp _map([], _), do: []
  defp _map([head|tail], f), do: [ f.(head) | _map(tail, f) ]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    _filter(l, f)
  end

  defp _filter([], _), do: []
  defp _filter([head|tail], f) do 
    if f.(head) do
      [ head | _filter(tail, f) ]
    else
      _filter(tail, f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    _reduce(l, acc, f)
  end

  defp _reduce([], acc, _), do: acc
  defp _reduce([head|tail], acc, f), do: f.(head, _reduce(tail, acc, f))

  @spec append(list, list) :: list
  def append(a, b) do
    _append(b, a)
  end

  defp _append([], l), do: l
  defp _append(l, []), do: l
  defp _append(l, [head|tail]), do: [head | _append(l, tail)]

  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end
