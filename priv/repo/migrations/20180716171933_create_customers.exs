defmodule MsgFarmer.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add(:email, :string)
      add(:phone, :string)
      add(:name, :string)
      add(:smsc_callback_setup, :boolean, default: false)
      add(:low_balance_sms_notified, :boolean, default: false)
      add(:account_id, :integer)
      add(:blocked_at, :utc_datetime)
      add(:deleted_at, :utc_datetime)

      timestamps(inserted_at: :created_at)
    end
  end
end
