defmodule MsgFarmer.Repo.Migrations.CreateDevelopersWebhooks do
  use Ecto.Migration

  def change do
    create table(:developers_webhooks) do
      add(:developer_id, references(:developers))
      add(:url, :string)
      add(:types, {:array, :integer})

      timestamps(inserted_at: :created_at)
    end
  end
end
