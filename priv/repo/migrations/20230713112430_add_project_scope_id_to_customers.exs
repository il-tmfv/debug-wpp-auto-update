defmodule Pushsms.Repo.Migrations.AddProjectScopeIdtoCustomers do
  use Ecto.Migration

  def change do
    alter table(:customers) do
      add(:project_scope_id, references(:project_scopes))
    end
  end
end
