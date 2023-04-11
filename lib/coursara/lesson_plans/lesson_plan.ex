defmodule Coursara.LessonPlans.LessonPlan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "lesson_plans" do
    field :body, :string
    field :title, :string
    # field :topic_id, :id
    belongs_to :topic, Coursara.Topics.Topic

    timestamps()
  end

  @doc false
  def changeset(lesson_plan, attrs) do
    lesson_plan
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
