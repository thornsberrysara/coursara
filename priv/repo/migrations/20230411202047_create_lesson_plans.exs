defmodule Coursara.Repo.Migrations.CreateLessonPlans do
  use Ecto.Migration

  def change do
    create table(:lesson_plans) do
      add :title, :string
      add :body, :text
      add :topic_id, references(:topics, on_delete: :nothing)

      timestamps()
    end

    create index(:lesson_plans, [:topic_id])
  end
end
