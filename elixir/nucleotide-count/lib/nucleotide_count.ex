defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  defp count([nuc | strand], nucleotide, accumulator) do
    new_accumulator = if nuc == nucleotide, do: accumulator + 1, else: accumulator
    count(strand, nucleotide, new_accumulator)
  end

  defp count([], _nucleotide, accumulator), do: accumulator

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    count(strand, nucleotide, 0)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
  end
end
