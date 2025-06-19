defmodule MsgFarmer.Repo.Migrations.AddAttachmentIdToDeliveries do
  use Ecto.Migration

  def change do
    alter table(:whats_app_deliveries) do
      add(:attachment_id, references(:attachments))
    end
  end
end
