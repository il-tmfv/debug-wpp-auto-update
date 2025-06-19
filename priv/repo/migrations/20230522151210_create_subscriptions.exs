defmodule MsgFarmer.Repo.Migrations.CreateSubscriptions do
  use Ecto.Migration

  def change do
    create table(:subscriptions) do
      add(:cost, :decimal, precision: 9, scale: 2)
      add(:active, :boolean, default: true)
      add(:payment_notification, :boolean, default: false)
      add(:yclients_chat_enabled, :boolean, default: false)
      add(:developer_chat_enabled, :boolean, default: false)
      add(:iframe_chat_enabled, :boolean, default: false)
      add(:account_id, :integer)

      timestamps(inserted_at: :created_at)
    end
  end
end
