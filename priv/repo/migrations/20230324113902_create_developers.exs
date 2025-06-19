defmodule MsgFarmer.Repo.Migrations.CreateDevelopers do
  use Ecto.Migration

  def change do
    create table(:developers) do
      add(:customer_id, references(:customers))
      add(:partner_id, :integer)
      add(:developer_type, :integer)
      add(:api_key, :string)

      timestamps(inserted_at: :created_at)
    end
  end
end
