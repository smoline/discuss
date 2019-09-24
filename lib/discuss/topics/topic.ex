defmodule Discuss.Topics.Topic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do
    field :title, :string
    belongs_to :user, Discuss.Users.User
    has_many :comments, Discuss.Topics.Comment
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:title, :user_id])
    |> validate_required([:title])
  end
end
