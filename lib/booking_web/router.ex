defmodule BookingWeb.Router do
  use BookingWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BookingWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/admin/days", DayController
    resources "/admin/slots", SlotController

  end

  # Other scopes may use custom stacks.
  # scope "/api", BookingWeb do
  #   pipe_through :api
  # end
end
