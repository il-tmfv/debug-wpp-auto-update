defmodule MsgFarmer.Repo.Migrations.CreateWhatsappUsers do
  use Ecto.Migration

  def change do
    create table(:whatsapp_users) do
      add(:customer_id, references(:customers))
      add(:phone, :string)

      timestamps(inserted_at: :created_at)
    end

    create unique_index(:whatsapp_users, [:phone])
    create index(:whatsapp_users, [:customer_id])
  end
end
