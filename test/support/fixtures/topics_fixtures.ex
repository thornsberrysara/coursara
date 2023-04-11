defmodule Coursara.TopicsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Coursara.Topics` context.
  """

  @doc """
  Generate a topic.
  """
  def topic_fixture(attrs \\ %{}) do
    {:ok, topic} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Coursara.Topics.create_topic()

    topic
  end
end
