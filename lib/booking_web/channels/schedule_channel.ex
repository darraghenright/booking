defmodule BookingWeb.ScheduleChannel do
  use Phoenix.Channel

  alias Booking.Schedule

  def join("schedule", _message, socket) do
    {:ok, socket}
  end

  def handle_in("update_days", _message, socket) do
    broadcast! socket, "update_days", %{days: Poison.encode!(Schedule.list_days)}
    {:noreply, socket}
  end

  def handle_in("lock_slot", %{"slot_id" => slot_id}, socket) do
    slot  = Schedule.get_slot!(slot_id)
    attrs = %{is_booked: true}

    case Schedule.update_slot(slot, attrs) do
      {:ok, _slot} -> broadcast! socket, "update_days", %{days: Poison.encode!(Schedule.list_days)}
      {:error, changeset} -> IO.puts "error: #{inspect changeset}"
    end

    {:noreply, socket}
  end

  def handle_in("unlock_slot", %{"slot_id" => slot_id}, socket) do
    slot  = Schedule.get_slot!(slot_id)
    attrs = %{is_booked: false}

    case Schedule.update_slot(slot, attrs) do
      {:ok, _slot} -> broadcast! socket, "update_days", %{days: Poison.encode!(Schedule.list_days)}
      {:error, changeset} -> IO.puts "error: #{inspect changeset}"
    end

    {:noreply, socket}
  end

  def handle_in("book_slot", %{"slot_id" => slot_id, "email" => email}, socket) do

    # @TODO chain handler here - remove redunancy
    # transmit error state to client

    slot  = Schedule.get_slot!(slot_id)
    attrs = %{is_booked: true, email: email}

    case Schedule.update_slot(slot, attrs) do
      {:ok, _slot} -> broadcast! socket, "update_days", %{days: Poison.encode!(Schedule.list_days)}
      {:error, changeset} -> IO.puts "error: #{inspect changeset}"
    end

    {:noreply, socket}
  end

end
