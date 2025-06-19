defmodule MsgFarmer.Repo.Migrations.SelenoidLog do
  use Ecto.Migration

  def change do
    create table(:selenoid_logs) do
      add :session, :string
      add :phone, :string
      add :trace, :text
      add :slug, :string

      add :customer_id, references(:customers, on_delete: :nothing)

      timestamps(inserted_at: :created_at)
    end
  end
end
