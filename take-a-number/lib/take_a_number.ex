defmodule TakeANumber do
  def start() do
    spawn(&listen/0)
  end

  defp listen(state \\ 0) do
    receive do
      {:report_state,pid} ->
        IO.puts"received"
        send(pid,state)
        listen(state)
      {:take_a_number,pid}->
        send(pid,state+1)
        listen(state+1)
       :stop -> :stop
       _ -> listen(state)
    end
  end
end
