defmodule MsgFarmer.Repo.Migrations.CreateSystemSetting do
  use Ecto.Migration

  def change do
    create table(:system_settings) do
      add(:slug, :string)
      add(:value, :map)
      add(:description, :string)

      timestamps(inserted_at: :created_at)
    end
  end
end
