defmodule MsgFarmer.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add(:subscription_paid_until, :date)
      add(:subscription_plan_id, :bigint)

      timestamps(inserted_at: :created_at)
    end
  end
end
