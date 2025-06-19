defmodule MsgFarmer.Repo.Migrations.CreateSelenoidSettings do
  use Ecto.Migration

  def change do
    create table(:selenoid_settings) do
      add(:kind, :integer)
      add(:description, :string)
      add(:value, :map)

      timestamps(inserted_at: :created_at)
    end
  end
end
