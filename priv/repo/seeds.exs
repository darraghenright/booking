alias Booking.Repo
alias Booking.Schedule.{Day, Slot}

slots = for hour <- 10..15, minute <- [0, 20, 40] do
  {:ok, time} = Time.new(hour, minute, 0)
  %Slot{time: time}
end

days = for day <- 7..30 do
  {:ok, date} = Date.new(2017, 9, day)
  %Day{date: date, slots: slots}
end

Enum.map(days, &Repo.insert!/1)
