defmodule Booking.Repo.Migrations.CreateSlots do
  use Ecto.Migration

  def change do
    create table(:slots) do
      add :time, :time
      add :is_booked, :boolean, default: false, null: false
      add :email, :string
      add :day_id, references(:days)

      timestamps()
    end

  end
end
