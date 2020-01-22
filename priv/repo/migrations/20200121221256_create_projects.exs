defmodule Reflect.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :description, :string
      add :start_date, :utc_datetime
      add :end_date, :utc_datetime
      add :type, :string
      add :user_id, references(:users), null: false

      timestamps()
    end

  end
end
