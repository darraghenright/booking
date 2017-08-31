defmodule Booking.Schedule.Slot do
  use Ecto.Schema
  import Ecto.Changeset
  alias Booking.Schedule.{Day, Seat, Slot}

  @derive {Poison.Encoder, only: [:id, :time, :is_booked, :seats]}

  schema "slots" do
    field :is_booked, :boolean, default: false
    field :time, :time
    belongs_to :day, Day
    has_many :seats, Seat

    timestamps()
  end

  @doc false
  def changeset(%Slot{} = slot, attrs) do
    slot
    |> cast(attrs, [:is_booked, :time])
    |> validate_required([:is_booked, :time])
    |> cast_assoc(:seats)
  end
end
