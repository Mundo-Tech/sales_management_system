defmodule SalesManagementSystem.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :address, :string
    field :email, :string
    field :hierarchy, :string, default: nil
    field :name, :string
    field :phone, :string
    field :position, :string, default: nil

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :phone, :address, :position, :hierarchy])
    |> validate_required([:name, :email, :phone, :address, :position, :hierarchy])
  end
end
