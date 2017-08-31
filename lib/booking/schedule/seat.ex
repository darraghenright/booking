defmodule Booking.Schedule.Seat do
  use Ecto.Schema
  import Ecto.Changeset
  alias Booking.Schedule.{Seat, Slot}

  @derive {Poison.Encoder, only: [:id, :is_booked, :name, :email]}

  schema "seats" do
    field :email, :string
    field :is_booked, :boolean, default: false
    field :name, :string
    belongs_to :slot, Slot

    timestamps()
  end

  @doc false
  def changeset(%Seat{} = seat, attrs) do
    seat
    |> cast(attrs, [:email, :name, :is_booked])
    |> validate_required([:is_booked])
    |> validate_format(:email, ~r/@/)
    # @TODO validate_required :email && :name if :is_booked
  end
end
