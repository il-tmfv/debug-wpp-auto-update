defmodule MsgFarmer.Repo.Migrations.CreateMsgBotConfigs do
  use Ecto.Migration

  def change do
    create table(:msg_bot_customer_configs) do
      add(:bot_enabled, {:array, :string}, default: [])
      add(:visit_confirmation, :boolean, default: false, null: false)
      add(:partner_link, :string)
      add(:office_name, :text)
      add(:about, :text)
      add(:phone_number, :string)
      add(:address, :text)
      add(:cost, :text)
      add(:customer_id, references(:customers, on_delete: :nothing))

      timestamps(inserted_at: :created_at)
    end

    create(index(:msg_bot_customer_configs, [:customer_id]))
  end
end
