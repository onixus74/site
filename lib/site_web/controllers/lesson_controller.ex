defmodule SiteWeb.LessonController do
  use SiteWeb, :controller

  alias Site.Lessons
  alias Site.Lessons.Lesson
  alias Site.Accounts

  plug :check_auth when action in [:new, :create, :edit, :update, :delete]

  defp check_auth(conn, _args) do
    if user_id = get_session(conn, :current_user_id) do
    current_user = Accounts.get_user!(user_id)

    conn
      |> assign(:current_user, current_user)
    else
      conn
      |> put_flash(:error, "You need to be signed in to access that page.")
      |> redirect(to: "/")
      |> halt()
    end
  end
  def index(conn, _params) do
    lesson = Lessons.list_lesson()
    render(conn, "index.html", lesson: lesson)
  end

  def new(conn, _params) do
    changeset = Lessons.change_lesson(%Lesson{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"lesson" => lesson_params}) do
    case Lessons.create_lesson(lesson_params) do
      {:ok, lesson} ->
        conn
        |> put_flash(:info, "Lesson created successfully.")
        |> redirect(to: lesson_path(conn, :show, lesson))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    lesson = Lessons.get_lesson!(id)
    render(conn, "show.html", lesson: lesson)
  end

  def edit(conn, %{"id" => id}) do
    lesson = Lessons.get_lesson!(id)
    changeset = Lessons.change_lesson(lesson)
    render(conn, "edit.html", lesson: lesson, changeset: changeset)
  end

  def update(conn, %{"id" => id, "lesson" => lesson_params}) do
    lesson = Lessons.get_lesson!(id)

    case Lessons.update_lesson(lesson, lesson_params) do
      {:ok, lesson} ->
        conn
        |> put_flash(:info, "Lesson updated successfully.")
        |> redirect(to: lesson_path(conn, :show, lesson))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", lesson: lesson, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    lesson = Lessons.get_lesson!(id)
    {:ok, _lesson} = Lessons.delete_lesson(lesson)

    conn
    |> put_flash(:info, "Lesson deleted successfully.")
    |> redirect(to: lesson_path(conn, :index))
  end
end
