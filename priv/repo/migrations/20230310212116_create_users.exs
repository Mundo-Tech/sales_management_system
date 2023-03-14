defmodule SalesManagementSystem.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do

    create table(:users) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :address, :string
      add :position, :string
      add :hierarchy, :string
    
      timestamps()
    end

  end
end
