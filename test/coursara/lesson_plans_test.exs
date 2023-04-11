defmodule Coursara.LessonPlansTest do
  use Coursara.DataCase

  alias Coursara.LessonPlans

  describe "lesson_plans" do
    alias Coursara.LessonPlans.LessonPlan

    import Coursara.LessonPlansFixtures

    @invalid_attrs %{body: nil, title: nil}

    test "list_lesson_plans/0 returns all lesson_plans" do
      lesson_plan = lesson_plan_fixture()
      assert LessonPlans.list_lesson_plans() == [lesson_plan]
    end

    test "get_lesson_plan!/1 returns the lesson_plan with given id" do
      lesson_plan = lesson_plan_fixture()
      assert LessonPlans.get_lesson_plan!(lesson_plan.id) == lesson_plan
    end

    test "create_lesson_plan/1 with valid data creates a lesson_plan" do
      valid_attrs = %{body: "some body", title: "some title"}

      assert {:ok, %LessonPlan{} = lesson_plan} = LessonPlans.create_lesson_plan(valid_attrs)
      assert lesson_plan.body == "some body"
      assert lesson_plan.title == "some title"
    end

    test "create_lesson_plan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = LessonPlans.create_lesson_plan(@invalid_attrs)
    end

    test "update_lesson_plan/2 with valid data updates the lesson_plan" do
      lesson_plan = lesson_plan_fixture()
      update_attrs = %{body: "some updated body", title: "some updated title"}

      assert {:ok, %LessonPlan{} = lesson_plan} = LessonPlans.update_lesson_plan(lesson_plan, update_attrs)
      assert lesson_plan.body == "some updated body"
      assert lesson_plan.title == "some updated title"
    end

    test "update_lesson_plan/2 with invalid data returns error changeset" do
      lesson_plan = lesson_plan_fixture()
      assert {:error, %Ecto.Changeset{}} = LessonPlans.update_lesson_plan(lesson_plan, @invalid_attrs)
      assert lesson_plan == LessonPlans.get_lesson_plan!(lesson_plan.id)
    end

    test "delete_lesson_plan/1 deletes the lesson_plan" do
      lesson_plan = lesson_plan_fixture()
      assert {:ok, %LessonPlan{}} = LessonPlans.delete_lesson_plan(lesson_plan)
      assert_raise Ecto.NoResultsError, fn -> LessonPlans.get_lesson_plan!(lesson_plan.id) end
    end

    test "change_lesson_plan/1 returns a lesson_plan changeset" do
      lesson_plan = lesson_plan_fixture()
      assert %Ecto.Changeset{} = LessonPlans.change_lesson_plan(lesson_plan)
    end
  end
end
