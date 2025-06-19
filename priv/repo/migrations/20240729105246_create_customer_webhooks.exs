defmodule MsgFarmer.Repo.Migrations.CreateCustomerWebhooks do
  use Ecto.Migration

  def change do
    create table(:customer_webhooks) do
      add(:customer_id, references(:customers))
      add(:url, :string)
      add(:types, {:array, :integer})

      timestamps(inserted_at: :created_at)
    end
  end
end
