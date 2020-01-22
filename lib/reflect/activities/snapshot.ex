defmodule Reflect.Activities.Snapshot do
  use Ecto.Schema
  import Ecto.Changeset

  schema "snapshots" do
    field :image, :string
    field :image_thumbnail, :string
    field :title, :string
    field :notes, :string
    field :taken_at, :utc_datetime

    belongs_to :project, Reflect.Activities.Project

    timestamps()
  end

  @doc false
  def changeset(snapshot, attrs) do
    required_fields = [:image, :image_string, :taken_at]
    optional_fields = [:title, :notes]

    snapshot
    |> cast(attrs, required_fields ++ optional_fields)
    |> validate_required(required_fields)
  end
end
