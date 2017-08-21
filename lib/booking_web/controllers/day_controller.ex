defmodule BookingWeb.DayController do
  use BookingWeb, :controller

  alias Booking.Schedule
  alias Booking.Schedule.Day

  def index(conn, _params) do
    days = Schedule.list_days()
    render(conn, "index.html", days: days)
  end

  def new(conn, _params) do
    changeset = Schedule.change_day(%Day{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"day" => day_params}) do
    case Schedule.create_day(day_params) do
      {:ok, day} ->
        conn
        |> put_flash(:info, "Day created successfully.")
        |> redirect(to: day_path(conn, :show, day))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    day = Schedule.get_day!(id)
    render(conn, "show.html", day: day)
  end

  def edit(conn, %{"id" => id}) do
    day = Schedule.get_day!(id)
    changeset = Schedule.change_day(day)
    render(conn, "edit.html", day: day, changeset: changeset)
  end

  def update(conn, %{"id" => id, "day" => day_params}) do
    day = Schedule.get_day!(id)

    case Schedule.update_day(day, day_params) do
      {:ok, day} ->
        conn
        |> put_flash(:info, "Day updated successfully.")
        |> redirect(to: day_path(conn, :show, day))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", day: day, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    day = Schedule.get_day!(id)
    {:ok, _day} = Schedule.delete_day(day)

    conn
    |> put_flash(:info, "Day deleted successfully.")
    |> redirect(to: day_path(conn, :index))
  end
end
