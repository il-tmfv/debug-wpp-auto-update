defmodule MsgFarmer.Repo.Migrations.CreateWhatsappCustomerDeliverySettings do
  use Ecto.Migration

  def change do
    create table(:whatsapp_customer_delivery_settings) do
      add(:max_queue_length, :integer)
      add(:customer_id, references(:customers, on_delete: :nothing))

      timestamps(inserted_at: :created_at)
    end

    create index(:whatsapp_customer_delivery_settings, [:customer_id])
  end
end
