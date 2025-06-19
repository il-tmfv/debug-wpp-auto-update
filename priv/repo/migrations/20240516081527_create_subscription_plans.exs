defmodule MsgFarmer.Repo.Migrations.CreateSubscriptionPlans do
  use Ecto.Migration

  def change do
    create table(:subscription_plans) do
      add(:name, :string, null: false)
      add(:description, :text)
      add(:category, :integer, default: 0, null: false)
      add(:project_scope_id, :bigint)

      timestamps(inserted_at: :created_at)
    end

    create(unique_index(:subscription_plans, [:name]))
  end
end
