defmodule CoursaraWeb.LessonPlanController do
  use CoursaraWeb, :controller

  alias Coursara.LessonPlans
  alias Coursara.LessonPlans.LessonPlan

  def index(conn, _params) do
    lesson_plans = LessonPlans.list_lesson_plans()
    render(conn, "index.html", lesson_plans: lesson_plans)
  end

  def new(conn, _params) do
    changeset = LessonPlans.change_lesson_plan(%LessonPlan{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"lesson_plan" => lesson_plan_params}) do
    case LessonPlans.create_lesson_plan(lesson_plan_params) do
      {:ok, lesson_plan} ->
        conn
        |> put_flash(:info, "Lesson plan created successfully.")
        |> redirect(to: Routes.lesson_plan_path(conn, :show, lesson_plan))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lesson_plan = LessonPlans.get_lesson_plan!(id)
    render(conn, "show.html", lesson_plan: lesson_plan)
  end

  def edit(conn, %{"id" => id}) do
    lesson_plan = LessonPlans.get_lesson_plan!(id)
    changeset = LessonPlans.change_lesson_plan(lesson_plan)
    render(conn, "edit.html", lesson_plan: lesson_plan, changeset: changeset)
  end

  def update(conn, %{"id" => id, "lesson_plan" => lesson_plan_params}) do
    lesson_plan = LessonPlans.get_lesson_plan!(id)

    case LessonPlans.update_lesson_plan(lesson_plan, lesson_plan_params) do
      {:ok, lesson_plan} ->
        conn
        |> put_flash(:info, "Lesson plan updated successfully.")
        |> redirect(to: Routes.lesson_plan_path(conn, :show, lesson_plan))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", lesson_plan: lesson_plan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lesson_plan = LessonPlans.get_lesson_plan!(id)
    {:ok, _lesson_plan} = LessonPlans.delete_lesson_plan(lesson_plan)

    conn
    |> put_flash(:info, "Lesson plan deleted successfully.")
    |> redirect(to: Routes.lesson_plan_path(conn, :index))
  end
end
