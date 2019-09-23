defmodule Discuss.Users do

  import Ecto.Query, warn: false

  alias Discuss.Repo
  alias Discuss.Users.User

  def insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end
end
