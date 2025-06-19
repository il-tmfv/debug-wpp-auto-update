defmodule MsgFarmer.Repo.Migrations.CreateMsgBotCustomerUnits do
  use Ecto.Migration

  def change do
    create table(:msg_bot_customer_units) do
      add :purpose, :integer, default: 0
      add :body, :text
      add :label, :string
      add :customer_id, references(:customers, on_delete: :nothing)

      timestamps(inserted_at: :created_at)
    end

    create index(:msg_bot_customer_units, [:customer_id])
  end
end
