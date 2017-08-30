alias Booking.Repo
alias Booking.Schedule.{Day, Seat, Slot}

use Timex

import Enum
import NaiveDateTime

opening_times = [
  [ # Opening Night
    ~N[2017-09-07T18:00:00],
    ~N[2017-09-07T20:20:00]
  ],
  [
    ~N[2017-09-08T11:00:00],
    ~N[2017-09-08T17:00:00]
  ],
  [
    ~N[2017-09-09T12:00:00],
    ~N[2017-09-09T17:00:00]
  ],
  [
    ~N[2017-09-12T11:00:00],
    ~N[2017-09-12T17:00:00]
  ],
  [
    ~N[2017-09-13T11:00:00],
    ~N[2017-09-13T17:00:00]
  ],
  [ # Sounds from a Safe Harbour
    ~N[2017-09-14T11:00:00],
    ~N[2017-09-14T17:00:00]
  ],
  [ # Sounds from a Safe Harbour
    ~N[2017-09-15T11:00:00],
    ~N[2017-09-15T17:00:00]
  ],
  [ # Sounds from a Safe Harbour
    ~N[2017-09-16T12:00:00],
    ~N[2017-09-16T17:00:00]
  ],

  [
    ~N[2017-09-19T11:00:00],
    ~N[2017-09-19T17:00:00]
  ],
  [
    ~N[2017-09-20T11:00:00],
    ~N[2017-09-20T17:00:00]
  ],
  [
    ~N[2017-09-21T11:00:00],
    ~N[2017-09-21T17:00:00]
  ],
  [ # Culture Night
    ~N[2017-09-22T11:00:00],
    ~N[2017-09-22T20:20:00]
  ],
  [
    ~N[2017-09-23T12:00:00],
    ~N[2017-09-23T17:00:00]
  ],
  [
    ~N[2017-09-26T11:00:00],
    ~N[2017-09-26T17:00:00]
  ],
  [
    ~N[2017-09-27T11:00:00],
    ~N[2017-09-27T17:00:00]
  ],
  [
    ~N[2017-09-28T11:00:00],
    ~N[2017-09-28T17:00:00]
  ],
  [ # Open House Cork
    ~N[2017-09-29T11:00:00],
    ~N[2017-09-29T17:00:00]
  ],
  [ # Open House Cork
    ~N[2017-09-30T12:00:00],
    ~N[2017-09-30T17:00:00]
  ]
]

seats = [%Seat{}, %Seat{}, %Seat{}]

create_days = fn [from|[until]] ->
  times = Timex.Interval.new(from: from, until: until, step: [minutes: 20])
  slots = map(times, &(%Slot{time: to_time(&1), seats: seats}))
  %Day{date: to_date(from), slots: slots}
end

opening_times
|> map(create_days)
|> map(&Repo.insert!/1)
