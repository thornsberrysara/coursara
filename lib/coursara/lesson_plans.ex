defmodule Coursara.LessonPlans do
  @moduledoc """
  The LessonPlans context.
  """

  import Ecto.Query, warn: false
  alias Coursara.Repo

  alias Coursara.LessonPlans.LessonPlan

  @doc """
  Returns the list of lesson_plans.

  ## Examples

      iex> list_lesson_plans()
      [%LessonPlan{}, ...]

  """
  def list_lesson_plans do
    Repo.all(LessonPlan)
  end

  @doc """
  Gets a single lesson_plan.

  Raises `Ecto.NoResultsError` if the Lesson plan does not exist.

  ## Examples

      iex> get_lesson_plan!(123)
      %LessonPlan{}

      iex> get_lesson_plan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_lesson_plan!(id), do: Repo.get!(LessonPlan, id)

  @doc """
  Creates a lesson_plan.

  ## Examples

      iex> create_lesson_plan(%{field: value})
      {:ok, %LessonPlan{}}

      iex> create_lesson_plan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_lesson_plan(attrs \\ %{}) do
    %LessonPlan{}
    |> LessonPlan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a lesson_plan.

  ## Examples

      iex> update_lesson_plan(lesson_plan, %{field: new_value})
      {:ok, %LessonPlan{}}

      iex> update_lesson_plan(lesson_plan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_lesson_plan(%LessonPlan{} = lesson_plan, attrs) do
    lesson_plan
    |> LessonPlan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a lesson_plan.

  ## Examples

      iex> delete_lesson_plan(lesson_plan)
      {:ok, %LessonPlan{}}

      iex> delete_lesson_plan(lesson_plan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_lesson_plan(%LessonPlan{} = lesson_plan) do
    Repo.delete(lesson_plan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking lesson_plan changes.

  ## Examples

      iex> change_lesson_plan(lesson_plan)
      %Ecto.Changeset{data: %LessonPlan{}}

  """
  def change_lesson_plan(%LessonPlan{} = lesson_plan, attrs \\ %{}) do
    LessonPlan.changeset(lesson_plan, attrs)
  end
end
