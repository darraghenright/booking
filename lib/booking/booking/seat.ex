defmodule Booking.Booking.Seat do
  use Ecto.Schema
  import Ecto.Changeset
  alias Booking.Booking.Seat


  schema "seats" do
    field :is_booked, :boolean, default: false
    field :name, :string
    field :slot_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Seat{} = seat, attrs) do
    seat
    |> cast(attrs, [:name, :is_booked])
    |> validate_required([:name, :is_booked])
  end
end
