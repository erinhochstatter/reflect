defmodule Reflect.Activities.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :description, :string
    field :end_date, :utc_datetime
    field :name, :string
    field :start_date, :utc_datetime
    field :type, :string

    has_many :snapshots, Reflect.Activities.Snapshot
    belongs_to :user, Reflect.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    required_fields = [:name, :start_date, :type]
    optional_fields = [:description, :end_date]

    project
    |> cast(attrs, required_fields ++ optional_fields)
    |> validate_required(required_fields)
  end
end
