defmodule Reflect.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :password_hash, :string

    has_many :projects, Reflect.Activities.Project

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    required_fields = [:name, :email, :password]
    
    user
    |> cast(attrs, required_fields)
    |> validate_required(required_fields)
    |> validate_length(:name, min: 2)
    |> validate_length(:password, min: 6)
    |> unique_constraint(:name)
    |> unique_constraint(:email)
    |> hash_password()
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(changeset, :password_hash, Pbkdf2.hash_pwd_salt(password))
      _ ->
        changeset
    end
  end
end
