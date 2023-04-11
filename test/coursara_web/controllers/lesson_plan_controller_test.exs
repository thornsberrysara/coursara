defmodule CoursaraWeb.LessonPlanControllerTest do
  use CoursaraWeb.ConnCase

  import Coursara.LessonPlansFixtures

  @create_attrs %{body: "some body", title: "some title"}
  @update_attrs %{body: "some updated body", title: "some updated title"}
  @invalid_attrs %{body: nil, title: nil}

  describe "index" do
    test "lists all lesson_plans", %{conn: conn} do
      conn = get(conn, Routes.lesson_plan_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Lesson plans"
    end
  end

  describe "new lesson_plan" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.lesson_plan_path(conn, :new))
      assert html_response(conn, 200) =~ "New Lesson plan"
    end
  end

  describe "create lesson_plan" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.lesson_plan_path(conn, :create), lesson_plan: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.lesson_plan_path(conn, :show, id)

      conn = get(conn, Routes.lesson_plan_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Lesson plan"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.lesson_plan_path(conn, :create), lesson_plan: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Lesson plan"
    end
  end

  describe "edit lesson_plan" do
    setup [:create_lesson_plan]

    test "renders form for editing chosen lesson_plan", %{conn: conn, lesson_plan: lesson_plan} do
      conn = get(conn, Routes.lesson_plan_path(conn, :edit, lesson_plan))
      assert html_response(conn, 200) =~ "Edit Lesson plan"
    end
  end

  describe "update lesson_plan" do
    setup [:create_lesson_plan]

    test "redirects when data is valid", %{conn: conn, lesson_plan: lesson_plan} do
      conn = put(conn, Routes.lesson_plan_path(conn, :update, lesson_plan), lesson_plan: @update_attrs)
      assert redirected_to(conn) == Routes.lesson_plan_path(conn, :show, lesson_plan)

      conn = get(conn, Routes.lesson_plan_path(conn, :show, lesson_plan))
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, lesson_plan: lesson_plan} do
      conn = put(conn, Routes.lesson_plan_path(conn, :update, lesson_plan), lesson_plan: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Lesson plan"
    end
  end

  describe "delete lesson_plan" do
    setup [:create_lesson_plan]

    test "deletes chosen lesson_plan", %{conn: conn, lesson_plan: lesson_plan} do
      conn = delete(conn, Routes.lesson_plan_path(conn, :delete, lesson_plan))
      assert redirected_to(conn) == Routes.lesson_plan_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.lesson_plan_path(conn, :show, lesson_plan))
      end
    end
  end

  defp create_lesson_plan(_) do
    lesson_plan = lesson_plan_fixture()
    %{lesson_plan: lesson_plan}
  end
end
