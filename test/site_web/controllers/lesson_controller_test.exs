defmodule SiteWeb.LessonControllerTest do
  use SiteWeb.ConnCase

  alias Site.Lessons

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:lesson) do
    {:ok, lesson} = Lessons.create_lesson(@create_attrs)
    lesson
  end

  describe "index" do
    test "lists all lesson", %{conn: conn} do
      conn = get conn, lesson_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Lesson"
    end
  end

#  describe "new lesson" do
#    test "renders form", %{conn: conn} do
#      conn = get conn, lesson_path(conn, :new)
#      assert html_response(conn, 200) =~ "New Lesson"
#    end
#  end

#  describe "create lesson" do
#    test "redirects to show when data is valid", %{conn: conn} do
#      conn = post conn, lesson_path(conn, :create), lesson: @create_attrs

#      assert %{id: id} = redirected_params(conn)
#      assert redirected_to(conn) == lesson_path(conn, :show, id)

#      conn = get conn, lesson_path(conn, :show, id)
#      assert html_response(conn, 200) =~ "Show Lesson"
#    end

#    test "renders errors when data is invalid", %{conn: conn} do
#      conn = post conn, lesson_path(conn, :create), lesson: @invalid_attrs
#      assert html_response(conn, 200) =~ "New Lesson"
#    end
#  end

#  describe "edit lesson" do
#    setup [:create_lesson]

#    test "renders form for editing chosen lesson", %{conn: conn, lesson: lesson} do
#      conn = get conn, lesson_path(conn, :edit, lesson)
#      assert html_response(conn, 200) =~ "Edit Lesson"
#    end
#  end

 # describe "update lesson" do
 #   setup [:create_lesson]

#    test "redirects when data is valid", %{conn: conn, lesson: lesson} do
 #     conn = put conn, lesson_path(conn, :update, lesson), lesson: @update_attrs
  #    assert redirected_to(conn) == lesson_path(conn, :show, lesson)

#      conn = get conn, lesson_path(conn, :show, lesson)
#      assert html_response(conn, 200) =~ "some updated name"
#    end

#    test "renders errors when data is invalid", %{conn: conn, lesson: lesson} do
#      conn = put conn, lesson_path(conn, :update, lesson), lesson: @invalid_attrs
#      assert html_response(conn, 200) =~ "Edit Lesson"
#    end
#  end

  # describe "delete lesson" do
  #  setup [:create_lesson]

#    test "deletes chosen lesson", %{conn: conn, lesson: lesson} do
#      conn = delete conn, lesson_path(conn, :delete, lesson)
#      assert redirected_to(conn) == lesson_path(conn, :index)
#      assert_error_sent 404, fn ->
#        get conn, lesson_path(conn, :show, lesson)
#      end
#    end
#  end

  defp create_lesson(_) do
    lesson = fixture(:lesson)
    {:ok, lesson: lesson}
  end
end
