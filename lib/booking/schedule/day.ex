defmodule Booking.Schedule.Day do
  use Ecto.Schema
  import Ecto.Changeset
  alias Booking.Schedule.{Day, Slot}

  @derive {Poison.Encoder, only: [:id, :date, :has_slots, :slots]}

  schema "days" do
    field :date, :date
    field :has_slots, :boolean, virtual: true
    has_many :slots, Slot

    timestamps()
  end

  @doc false
  def changeset(%Day{} = day, attrs) do
    day
    |> cast(attrs, [:date, :has_slots])
    |> validate_required([:date, :has_slots])
  end
end
