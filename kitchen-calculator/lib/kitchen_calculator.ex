defmodule KitchenCalculator do
  def get_volume(volume_pair) do
  {_, volume} = volume_pair
  volume
  end

  def to_milliliter(volume_pair) do
    {unit, volume} = volume_pair
    volume=
      case unit do
      :milliliter -> volume
      :liter -> volume * 1000
      :teaspoon -> volume * 5
      :tablespoon -> volume * 15
      :cup -> volume * 240
      :fluid_ounce -> volume * 30
    end
    {:milliliter, volume}
  end

  def from_milliliter({:milliliter, volume}, unit) do
    volume=
      case unit do
      :milliliter -> volume
      :liter -> volume / 1000
      :teaspoon -> volume / 5
      :tablespoon -> volume / 15
      :cup -> volume / 240
      :fluid_ounce -> volume / 30
    end
    {unit, volume}
  end

  def convert(volume_pair, unit) do
    volume_pair |> to_milliliter |> from_milliliter(unit)
  end
end

