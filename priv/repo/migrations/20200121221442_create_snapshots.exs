defmodule Reflect.Repo.Migrations.CreateSnapshots do
  use Ecto.Migration

  def change do
    create table(:snapshots) do
      add :title, :string
      add :image, :string
      add :image_thumbnail, :string
      add :notes, :string
      add :taken_at, :utc_datetime
      add :project_id, references(:projects), null: false

      timestamps()
    end

  end
end
