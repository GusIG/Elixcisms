defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: hd(list)


    def increment_day_count([]), do: [1]
  def increment_day_count([head|tail]), do: [head+1|tail]

  def has_day_without_birds?([head|tail]) do
    head == 0 or has_day_without_birds?(tail)
  end

  def has_day_without_birds?([]), do: false

  def total(list) do
    do_sum(list, 0)
  end

  defp do_sum([], acc), do: acc
  defp do_sum([head|tail], acc), do: do_sum(tail, acc+head)


  def busy_days([]), do: 0
  def busy_days([head | tail]) do
    busy?(head)+busy_days(tail)
  end

  defp busy?(num) when num >4, do: 1
  defp busy?(_), do: 0
end
