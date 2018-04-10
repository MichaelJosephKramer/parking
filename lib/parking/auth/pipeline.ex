defmodule Parking.Auth.Pipeline do
  @moduledoc false

  use Guardian.Plug.Pipeline,
    otp_app: :parking,
    error_handler: Parking.Auth.ErrorHandler,
    module: Parking.Auth.Guardian

  plug(Guardian.Plug.VerifySession, claims: %{"typ" => "access"})
  plug(Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"})
  plug(Guardian.Plug.LoadResource, allow_blank: true)
end
