defmodule Booking.Schedule.Slot do
  use Ecto.Schema
  import Ecto.Changeset
  alias Booking.Schedule.{Day, Slot}


  schema "slots" do
    field :email, :string
    field :is_booked, :boolean, default: false
    field :time, :time
    belongs_to :day, Day

    timestamps()
  end

  @doc false
  def changeset(%Slot{} = slot, attrs) do
    slot
    |> cast(attrs, [:email, :is_booked, :time])
    |> validate_required([:email, :is_booked, :time])
  end
end
