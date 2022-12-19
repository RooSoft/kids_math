defmodule KidsMath.Repo do
  use Ecto.Repo,
    otp_app: :kids_math,
    adapter: Ecto.Adapters.SQLite3
end
