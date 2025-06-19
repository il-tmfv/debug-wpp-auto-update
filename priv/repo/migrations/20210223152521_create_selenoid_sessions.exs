defmodule MsgFarmer.Repo.Migrations.CreateSelenoidSessions do
  use Ecto.Migration

  def change do
    create table(:selenoid_sessions) do
      add(:customer_id, references(:customers))
      add(:session_id, :string)
      add(:phone, :string)
      add(:response, :map)
      add(:authenticated, :boolean, default: false)
      add(:bot_enabled, :boolean, default: false)
      add(:visit_confirmation, :boolean, default: false)

      timestamps(inserted_at: :created_at)
    end

    create(unique_index(:selenoid_sessions, :customer_id))
    create(unique_index(:selenoid_sessions, :session_id))
  end
end
