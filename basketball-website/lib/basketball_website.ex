defmodule BasketballWebsite do

  def extract_from_path(data,path)  when is_binary(path), do: extract_from_path(data,String.split(path,"."))
  def extract_from_path(data, []), do: data
  def extract_from_path(data, [h|t]) do
    extract_from_path(data[h],t)
  end

  def get_in_path(data, path) when is_binary(path) do
    get_in_path(data,String.split(path,"."))
  end
  def get_in_path(data,path) do
    get_in(data,path)
  end
end

