defmodule Pushsms.Repo.Migrations.CreateProjectScopes do
  use Ecto.Migration

  def change do
    create table(:project_scopes) do
      add(:name, :integer)
      add(:default_lang, :string)
      add(:default_phone_country, :string)

      timestamps(inserted_at: :created_at)
    end
  end
end
