defmodule ParkingWeb.Router do
  use ParkingWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  # Other scopes may use custom stacks.
  # scope "/api", ParkingWeb do
  #   pipe_through :api
  # end

  pipeline :auth do
    plug(Parking.Auth.Pipeline)
  end

  pipeline :ensure_auth do
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  # Maybe logged in scope
  scope "/", ParkingWeb do
    pipe_through([:browser, :auth])
    get("/", PageController, :index)
    post("/", PageController, :login)
    get("/logout", PageController, :logout)
  end

  # Definitely logged in scope
  scope "/", ParkingWeb do
    pipe_through([:browser, :auth, :ensure_auth])
    get("/secret", PageController, :secret)
  end
end
