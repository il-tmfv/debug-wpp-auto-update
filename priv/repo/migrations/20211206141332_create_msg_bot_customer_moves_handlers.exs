defmodule MsgFarmer.Repo.Migrations.CreateMsgBotCustomerMovesHandlers do
  use Ecto.Migration

  def change do
    create table(:msg_bot_customer_moves_handlers) do
      add :msg_bot_handler_id, references(:msg_bot_handlers, on_delete: :nothing)
      add :msg_bot_customer_move_id, references(:msg_bot_customer_moves, on_delete: :nothing)

      timestamps(inserted_at: :created_at)
    end

    create index(:msg_bot_customer_moves_handlers, [:msg_bot_handler_id])
    create index(:msg_bot_customer_moves_handlers, [:msg_bot_customer_move_id])
  end
end
