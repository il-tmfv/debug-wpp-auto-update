defmodule MsgFarmer.Repo.Migrations.CreateYclientsCustomers do
  use Ecto.Migration

  def change do
    create table(:yclients_customers) do
      add(:customer_id, :integer)
      add(:salon_id, :integer)
      add(:status, :integer)
      add(:app_type, :integer)
      add(:salon_info, :map)
      add(:salon_services, {:array, :map})
      add(:booking_forms, {:array, :map})
      add(:deleted_at, :utc_datetime)
      add(:salon_name, :string)
      add(:salon_address, :string)

      timestamps(inserted_at: :created_at)
    end
  end
end
