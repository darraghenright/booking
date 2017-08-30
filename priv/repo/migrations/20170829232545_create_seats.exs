defmodule Booking.Repo.Migrations.CreateSeats do
  use Ecto.Migration

  def change do
    create table(:seats) do
      add :name, :string
      add :is_booked, :boolean, default: false, null: false
      add :slot_id, references(:slot, on_delete: :nothing)

      timestamps()
    end

    create index(:seats, [:slot_id])
  end
end
