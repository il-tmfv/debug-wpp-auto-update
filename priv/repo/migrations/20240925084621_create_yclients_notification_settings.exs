defmodule MsgFarmer.Repo.Migrations.CreateYclientsNotificationSettings do
  use Ecto.Migration

  def change do
    create table(:yclients_notification_settings) do
      add(:yclients_customer_id, references(:yclients_customers))
      add(:visit_time_offset, :integer)
      add(:body, :text)
      add(:dispatch_routing, {:array, :string})
      add(:action_type, :integer)
      add(:additional_data, :map)
      add(:is_enabled, :boolean, default: true)
      add(:fixed_time, :string)
      add(:without_duplicates, :boolean)
      add(:attachment_id, :integer)

      timestamps(inserted_at: :created_at)
    end
  end
end
