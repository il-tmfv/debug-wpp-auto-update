defmodule MsgFarmer.Repo.Migrations.CreateMsgBotWhatsappChats do
  use Ecto.Migration

  def change do
    create table(:msg_bot_customer_chats) do
      add :chat_id, :string
      add :muted, :boolean, default: false, null: false
      add :waiting_admin, :boolean, default: false, null: false

      add :customer_id, references(:customers, on_delete: :nothing)
      add :current_unit_id, references(:msg_bot_customer_units, on_delete: :nothing)

      timestamps(inserted_at: :created_at)
    end

  end
end
