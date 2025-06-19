defmodule MsgFarmer.Repo.Migrations.CreateSelenoidSessionDeleteLog do
  use Ecto.Migration

  def change do
    create table(:selenoid_session_delete_logs) do
      add(:customer_id, references(:customers))
      add(:session_id, :string)
      add(:actual_created_at, :utc_datetime)
      add(:terminated_at, :utc_datetime)

      timestamps(inserted_at: :created_at)
    end
  end
end
