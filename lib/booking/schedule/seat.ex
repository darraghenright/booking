defmodule Booking.Schedule.Seat do
  use Ecto.Schema
  import Ecto.Changeset
  alias Booking.Schedule.{Seat, Slot}

  @derive {Poison.Encoder, only: [:id, :is_booked]}

  schema "seats" do
    field :is_booked, :boolean, default: false
    field :name, :string
    belongs_to :slot, Slot

    timestamps()
  end

  @doc false
  def changeset(%Seat{} = seat, attrs) do
    seat
    |> cast(attrs, [:name, :is_booked])
    |> validate_required([:name, :is_booked])
  end
end
