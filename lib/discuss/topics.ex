defmodule Discuss.Topics do

  import Ecto.Query, warn: false

  alias Discuss.Repo
  alias Discuss.Topics.Topic
  alias Discuss.Topics.Comment

  def list_topics do
    Repo.all(Topic)
  end

  def create_topic(attrs \\ %{}) do
    %Topic{}
    |> Topic.changeset(attrs)
    |> Repo.insert()
  end

  def get_topic!(id), do: Repo.get!(Topic, id)

  def update_topic(%Topic{} = topic, attrs) do
    topic
    |> Topic.changeset(attrs)
    |> Repo.update()
  end

  def delete_topic(%Topic{} = topic) do
    Repo.delete(topic)
  end

  def change_topic(%Topic{} = topic) do
    Topic.changeset(topic, %{})
  end

  def build_topic_assoc_create_comment(%Topic{} = topic, %{"content" => content}, user_id) do
    topic
    |> Ecto.build_assoc(:comments, user_id: user_id)
    |> Comment.changeset(%{content: content})
    |> Repo.insert()
  end

  def get_topic_and_comments(id) do
    Repo.get(Topic, id)
    |> Repo.preload(comments: [:user])
  end

end
