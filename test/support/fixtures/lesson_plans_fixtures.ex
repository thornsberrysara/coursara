defmodule Coursara.LessonPlansFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Coursara.LessonPlans` context.
  """

  @doc """
  Generate a lesson_plan.
  """
  def lesson_plan_fixture(attrs \\ %{}) do
    {:ok, lesson_plan} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Coursara.LessonPlans.create_lesson_plan()

    lesson_plan
  end
end
