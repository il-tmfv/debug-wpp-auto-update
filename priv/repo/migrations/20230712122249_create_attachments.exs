defmodule MsgFarmer.Repo.Migrations.CreateAttachments do
  use Ecto.Migration

  def change do
    create table(:attachments) do
      add(:file_name, :string)
      add(:caption, :string)
      add(:type, :integer)
      add(:file_size, :bigint)

      timestamps(inserted_at: :created_at)
    end
  end
end
