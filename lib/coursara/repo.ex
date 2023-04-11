defmodule Coursara.Repo do
  use Ecto.Repo,
    otp_app: :coursara,
    adapter: Ecto.Adapters.Postgres
end
