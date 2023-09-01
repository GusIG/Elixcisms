defmodule LibraryFees do
  @noon ~T[12:00:00]
  def datetime_from_string(string) do
    NaiveDateTime.from_iso8601!(string)
  end

  def before_noon?(datetime) do
    Time.before?(NaiveDateTime.to_time(datetime),@noon)
  end

  def return_date(checkout_datetime) do
    val =if before_noon?(checkout_datetime), do: 28, else: 29
    NaiveDateTime
    .add(checkout_datetime,val,:day)
    |>NaiveDateTime.to_date()
  end


  def days_late(planned_return_date, actual_return_datetime) do
    days=NaiveDateTime.to_date(actual_return_datetime)
    |>Date.diff(planned_return_date)
    if days<=0, do: 0,else: days
    end

  def monday?(datetime) do
    NaiveDateTime.to_date(datetime)
    |>Date.day_of_week() == 1
  end

  def calculate_late_fee(checkout, return, rate) do
      act_return=datetime_from_string(return)
      days_late=
        datetime_from_string(checkout)
      |>return_date()
      |>days_late(act_return)
      fee_base=days_late*rate

      if monday?(act_return), do:
        floor(fee_base * 0.5),
      else: fee_base
end
end


