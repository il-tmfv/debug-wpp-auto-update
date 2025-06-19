defmodule MsgFarmer.Repo.Migrations.CreateWhatsAppDeliveries do
  use Ecto.Migration

  def change do
    create table(:whats_app_deliveries) do
      add(:phone, :string)
      add(:formatted_phone, :string)
      add(:text, :string)
      add(:status, :integer, default: 0)
      add(:customer_id, references(:customers))
      add(:external_id, :integer)
      add(:need_send_callback, :boolean, default: true)
      add(:chat_id, :string)
      add(:message_id, :string)
      add(:source_type, :integer)
      add(:reply_to_message_id, :string)
      add(:simulate_typing, :boolean, default: true, null: false)

      timestamps(inserted_at: :created_at)
    end
  end
end
