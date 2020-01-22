# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Reflect.Repo.insert!(%Reflect.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#

alias Reflect.Repo
alias Reflect.Activities.{Project, Snapshot}
alias Reflect.Accounts.User

#
# USERS
#

erin =
  %User{}
  |> User.changeset(%{
      name: "erin",
      email: "ehochstatter@example.com",
      password: "secret"
    })
  |> Repo.insert!

_luna =
  %User{}
  |> User.changeset(%{
      name: "luna pup",
      email: "luna@example.com",
      password: "secret"
    })
  |> Repo.insert!

_michael =
  %User{}
  |> User.changeset(%{
      name: "michael",
      email: "michael@example.com",
      password: "secret"
    })
  |> Repo.insert!

#
# Projects
#

images_url = "#{ReflectWeb.Endpoint.url}/images"
{:ok, project_date, 0} = DateTime.from_iso8601("2019-01-20T13:39:42Z")
%Project{
  name: "Luna's Toy Basket",
  description: "Wrangle that pup's stash!",
  user: erin,
  start_date: project_date,
  type: "finishable",
  snapshots: [
    %Snapshot{
        image: "#{images_url}/01_before_pic.jpg",
        image_thumbnail: "#{images_url}/01_before_pic.jpg", #TODO: Make a thumbnail
        taken_at: project_date,
    }
  ]
} |> Repo.insert!


