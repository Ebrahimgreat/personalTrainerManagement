defmodule Crohnjobs.Repo do
  use Ecto.Repo,
    otp_app: :crohnjobs,
    adapter: Ecto.Adapters.Postgres
end
