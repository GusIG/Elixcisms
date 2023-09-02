defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, &(&1.price))
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory,&(!&1.price))
  end

#  def update_names(inventory,old_word, new_word) do
#    Enum.map(inventory,&(Map.update(&1, :name, String.replace(&1.name,old_word,new_word))))
#  end
  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, &Map.update!(&1, :name, fn name-> String.replace(name,old_word,new_word) end))
  end

  def increase_quantity(item, count) do
    %{item | quantity_by_size: Map.new(item.quantity_by_size, fn {k,v}->{k,v+count} end)}
  end

  def total_quantity(item) do
    item.quantity_by_size|>
    Enum.reduce(0, fn {_, amount}, acc -> acc + amount end)
  end
end
