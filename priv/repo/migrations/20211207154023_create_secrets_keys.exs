defmodule MsgFarmer.Repo.Migrations.CreateSecretKeys do
  use Ecto.Migration

  def change do
    create table(:secret_keys) do
      add :token, :text
      add :secret_type, :string
      add :customer_id, references(:customers, on_delete: :nothing)

      timestamps(inserted_at: :created_at)
    end
  end
end
