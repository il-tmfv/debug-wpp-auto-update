defmodule MsgFarmer.Repo.Migrations.CreateMsgBotHandlers do
  use Ecto.Migration

  def change do
    create table(:msg_bot_handlers) do
      add :action_type, :integer

      timestamps(inserted_at: :created_at)
    end

  end
end
