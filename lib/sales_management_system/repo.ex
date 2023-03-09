defmodule SalesManagementSystem.Repo do
  use Ecto.Repo,
    otp_app: :sales_management_system,
    adapter: Ecto.Adapters.Postgres
end
