defmodule Booking.ScheduleTest do
  use Booking.DataCase

  alias Booking.Schedule

  describe "days" do
    alias Booking.Schedule.Day

    @valid_attrs %{date: ~D[2010-04-17], has_slots: true}
    @update_attrs %{date: ~D[2011-05-18], has_slots: false}
    @invalid_attrs %{date: nil, has_slots: nil}

    def day_fixture(attrs \\ %{}) do
      {:ok, day} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_day()

      day
    end

    test "list_days/0 returns all days" do
      day = day_fixture()
      assert Schedule.list_days() == [day]
    end

    test "get_day!/1 returns the day with given id" do
      day = day_fixture()
      assert Schedule.get_day!(day.id) == day
    end

    test "create_day/1 with valid data creates a day" do
      assert {:ok, %Day{} = day} = Schedule.create_day(@valid_attrs)
      assert day.date == ~D[2010-04-17]
      assert day.has_slots == true
    end

    test "create_day/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_day(@invalid_attrs)
    end

    test "update_day/2 with valid data updates the day" do
      day = day_fixture()
      assert {:ok, day} = Schedule.update_day(day, @update_attrs)
      assert %Day{} = day
      assert day.date == ~D[2011-05-18]
      assert day.has_slots == false
    end

    test "update_day/2 with invalid data returns error changeset" do
      day = day_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_day(day, @invalid_attrs)
      assert day == Schedule.get_day!(day.id)
    end

    test "delete_day/1 deletes the day" do
      day = day_fixture()
      assert {:ok, %Day{}} = Schedule.delete_day(day)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_day!(day.id) end
    end

    test "change_day/1 returns a day changeset" do
      day = day_fixture()
      assert %Ecto.Changeset{} = Schedule.change_day(day)
    end
  end

  describe "slots" do
    alias Booking.Schedule.Slot

    @valid_attrs %{email: "some email", is_booked: true, time: ~T[14:00:00.000000]}
    @update_attrs %{email: "some updated email", is_booked: false, time: ~T[15:01:01.000000]}
    @invalid_attrs %{email: nil, is_booked: nil, time: nil}

    def slot_fixture(attrs \\ %{}) do
      {:ok, slot} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Schedule.create_slot()

      slot
    end

    test "list_slots/0 returns all slots" do
      slot = slot_fixture()
      assert Schedule.list_slots() == [slot]
    end

    test "get_slot!/1 returns the slot with given id" do
      slot = slot_fixture()
      assert Schedule.get_slot!(slot.id) == slot
    end

    test "create_slot/1 with valid data creates a slot" do
      assert {:ok, %Slot{} = slot} = Schedule.create_slot(@valid_attrs)
      assert slot.email == "some email"
      assert slot.is_booked == true
      assert slot.time == ~T[14:00:00.000000]
    end

    test "create_slot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Schedule.create_slot(@invalid_attrs)
    end

    test "update_slot/2 with valid data updates the slot" do
      slot = slot_fixture()
      assert {:ok, slot} = Schedule.update_slot(slot, @update_attrs)
      assert %Slot{} = slot
      assert slot.email == "some updated email"
      assert slot.is_booked == false
      assert slot.time == ~T[15:01:01.000000]
    end

    test "update_slot/2 with invalid data returns error changeset" do
      slot = slot_fixture()
      assert {:error, %Ecto.Changeset{}} = Schedule.update_slot(slot, @invalid_attrs)
      assert slot == Schedule.get_slot!(slot.id)
    end

    test "delete_slot/1 deletes the slot" do
      slot = slot_fixture()
      assert {:ok, %Slot{}} = Schedule.delete_slot(slot)
      assert_raise Ecto.NoResultsError, fn -> Schedule.get_slot!(slot.id) end
    end

    test "change_slot/1 returns a slot changeset" do
      slot = slot_fixture()
      assert %Ecto.Changeset{} = Schedule.change_slot(slot)
    end
  end
end
