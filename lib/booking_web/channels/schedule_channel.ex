defmodule BookingWeb.ScheduleChannel do
  use Phoenix.Channel

  alias Booking.Schedule

  def join("schedule", _message, socket) do
    reply = %{days: Poison.encode!(Schedule.list_days)}
    {:ok, reply, socket}
  end

  def handle_in("book_slot", %{"id" => id}, socket) do
    payload = %{command: "book_slot", event: "slot_booked", id: id}
    broadcast! socket, "slot_booked", payload
    {:noreply, socket}
  end

end
