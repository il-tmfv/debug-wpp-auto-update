defmodule MsgFarmer.Repo.Migrations.CreateMsgBotCustomerMoves do
  use Ecto.Migration

  def change do
    create table(:msg_bot_customer_moves) do
      add(:value, :string)
      add(:order, :integer)
      add(:msg_bot_from_unit_id, references(:msg_bot_customer_units, on_delete: :nothing))
      add(:msg_bot_to_unit_id, references(:msg_bot_customer_units, on_delete: :nothing))

      timestamps(inserted_at: :created_at)
    end

    create(index(:msg_bot_customer_moves, [:msg_bot_from_unit_id]))
    create(index(:msg_bot_customer_moves, [:msg_bot_to_unit_id]))
  end
end
