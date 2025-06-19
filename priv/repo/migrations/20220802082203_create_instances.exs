defmodule MsgFarmer.Repo.Migrations.CreateInstances do
  use Ecto.Migration

  def change do
    create table(:instances) do
      add :customer_id, references(:customers, on_delete: :nothing)
      add :developer_id, :integer

      timestamps(inserted_at: :created_at)
    end
  end
end
